import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/controllers/pralogin_controller.dart';
import 'package:hallotaxv2/models/pralogin_model.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:hallotaxv2/pages/consultant_page.dart';

import '../home_page.dart';

class PraloggedPage extends StatefulWidget {
  final UserModel user;
  const PraloggedPage({super.key, required this.user});

  @override
  State<PraloggedPage> createState() => _PraloggedPageState();
}

class _PraloggedPageState extends State<PraloggedPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  List<PraloginModel> listPralogin = [];
  PraloginController praloginController = PraloginController();
  String judul = '';
  String imageUrl = '';
  String deskripsi = '';

  @override
  void initState() {
    getPralogin();
    super.initState();
  }

  getPralogin() async {
    listPralogin = await praloginController.getPralogin();
    setState(() {
      judul = listPralogin[0].judul;
      imageUrl = listPralogin[0].imageUrl;
      deskripsi = listPralogin[0].deskripsi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.user.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var userData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(widget.user.image),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      userData['name'],
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: mainFont,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Kamu punya highlight baru hari ini',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: mainFont,
                        fontSize: 16,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listPralogin.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? const EdgeInsets.only(left: 30, right: 10)
                              : const EdgeInsets.only(right: 10),
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: mainColor, width: 2),
                            color: index % 2 == 0 ? mainColor : Colors.grey,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(listPralogin[index].imageUrl)),
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.user.role == 'Customer'
                                          ? HomePage(
                                              user: widget.user,
                                            )
                                          : ConsultantPage(
                                              user: widget.user,
                                            )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: mainColor),
            );
          }
        });
  }
}

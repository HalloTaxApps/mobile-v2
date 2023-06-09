import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:hallotaxv2/pages/consultant_page/baru_consultant.dart';
import 'package:hallotaxv2/pages/profil_page.dart';
import 'consultant_page/berlangsung_consultant.dart';

class ConsultantPage extends StatefulWidget {
  final UserModel user;
  const ConsultantPage({
    super.key,
    required this.user,
  });

  @override
  State<ConsultantPage> createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  late Widget isiSection = BaruConsultant(
    user: widget.user,
  );
  late bool isBerlangsung = false;
  late bool isBaru = true;
  late bool isNotif = true;
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';
  late IconData icon = Icons.message_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.user.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var userData = snapshot.data;
              return Stack(
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                          image: AssetImage('assets/images/bgillustration.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilPage(
                                              user: widget.user,
                                            )));
                              },
                              splashColor: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  userData['image'],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Halo, ${userData['name']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            isNotif && isBaru
                                ? InkWell(
                                    child: Stack(
                                      children: [
                                        customIconbutton(),
                                        Row(
                                          children: const [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                radius: 6,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : customIconbutton(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  left: 20,
                                ),
                                child: Text(
                                  isBaru
                                      ? 'Konsultasi Baru'
                                      : 'Konsultasi Berlangsung',
                                  style: TextStyle(
                                    fontFamily: mainFont,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    physics: const BouncingScrollPhysics(),
                                    children: [
                                      isiSection,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
          }),
    );
  }

  IconButton customIconbutton() {
    return IconButton(
      onPressed: () {
        setState(() {
          isiSection = BaruConsultant(
            user: widget.user,
          );
          if (isBaru) {
            isiSection = BerlangsungConsultant(
              user: widget.user,
            );
            icon = Icons.new_label_outlined;
            isBaru = false;
            isBerlangsung = true;
          } else if (isBerlangsung) {
            isiSection = BaruConsultant(
              user: widget.user,
            );
            icon = Icons.message_outlined;
            isBerlangsung = false;
            isBaru = true;
          }
        });
      },
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';

class BaruPage extends StatefulWidget {
  final UserModel user;
  const BaruPage({super.key, required this.user});

  @override
  State<BaruPage> createState() => _BaruPageState();
}

class _BaruPageState extends State<BaruPage> {
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .collection('messages')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        var count = 0;
        if (snapshot.hasData) {
          if (snapshot.data.docs.isEmpty) {
            return noData();
          }
          for (var i = 0; i < snapshot.data.docs.length; i++) {
            if (snapshot.data.docs[i]['status'] == 'new') {
              count++;
            }
          }
          if (count == 0) {
            return noData();
          } else {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var lastMsg = snapshot.data!.docs[index]['last_msg'];
                  var msgStatus = snapshot.data!.docs[index]['status'];
                  var msgType = snapshot.data!.docs[index]['type'];
                  return msgStatus == 'new'
                      ? containerListTile(
                          msgType,
                          lastMsg,
                          msgType == 'Anonymous'
                              ? 'https://cdn-icons-png.flaticon.com/512/180/180691.png'
                              : widget.user.image,
                          '',
                        )
                      : const SizedBox();
                });
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget containerListTile(
    String nama,
    String lastMsg,
    String imageUrl,
    var receiver,
  ) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            nama,
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            lastMsg,
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '08:37',
                style: TextStyle(
                  fontFamily: mainFont,
                  color: Colors.black38,
                  fontSize: 10,
                ),
              ),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontFamily: mainFont,
                      color: Colors.black38,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column noData() {
    return Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        Image(
          image: AssetImage('assets/images/nodata.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Data Kosong',
          style: TextStyle(
            color: Colors.black38,
            fontFamily: 'Nunito',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

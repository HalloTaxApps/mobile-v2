import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:intl/intl.dart';

import '../percakapan_page.dart';

class BerlangsungConsultant extends StatefulWidget {
  final UserModel user;
  const BerlangsungConsultant({super.key, required this.user});

  @override
  State<BerlangsungConsultant> createState() => _BerlangsungConsultantState();
}

class _BerlangsungConsultantState extends State<BerlangsungConsultant> {
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .collection('messages')
          .orderBy('last_msg_time', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        var count = 0;
        if (snapshot.hasData) {
          if (snapshot.data.docs.isEmpty) {
            return noData();
          }
          for (var i = 0; i < snapshot.data.docs.length; i++) {
            if (snapshot.data.docs[i]['status'] == 'on') {
              count++;
            }
          }
          if (count == 0) {
            return noData();
          } else {
            return Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var friendId = snapshot.data!.docs[index]['senderId'];
                    var lastMsg = snapshot.data!.docs[index]['last_msg'];
                    var msgStatus = snapshot.data!.docs[index]['status'];
                    var msgType = snapshot.data!.docs[index]['type'];
                    var msgId = snapshot.data!.docs[index].id;
                    var label = snapshot.data!.docs[index]['label'];
                    var time = snapshot.data!.docs[index]['last_msg_time'];
                    var dateTime = DateTime.fromMillisecondsSinceEpoch(
                        time.millisecondsSinceEpoch);
                    var dateFormat = DateFormat('k:mm').format(dateTime);
                    return msgStatus == 'on'
                        ? FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(friendId)
                                .get(),
                            builder: (context, AsyncSnapshot asyncSnapshot) {
                              if (asyncSnapshot.hasData) {
                                var friend = asyncSnapshot.data;
                                return friend['role'] == 'Customer'
                                    ? containerListTile(
                                        msgType == 'Anonymous'
                                            ? msgType
                                            : friend['name'],
                                        lastMsg,
                                        msgType == 'Anonymous'
                                            ? 'https://cdn-icons-png.flaticon.com/512/180/180691.png'
                                            : friend['image'],
                                        friend,
                                        msgType,
                                        msgId,
                                        label,
                                        dateFormat,
                                      )
                                    : const SizedBox();
                              }
                              return const LinearProgressIndicator(
                                color: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                minHeight: 1,
                              );
                            },
                          )
                        : const SizedBox();
                  }),
            );
          }
        } else {
          return Center(
              child: LinearProgressIndicator(
            color: mainColor,
          ));
        }
      },
    );
  }

  Widget containerListTile(
    String nama,
    String lastMsg,
    String imageUrl,
    var receiver,
    var msgType,
    var msgId,
    var label,
    var time,
  ) {
    return Container(
      height: 80,
      // width: double.infinity,
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
            radius: 24,
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
              label
                  ? Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // child: Center(
                      //   child: Text(
                      //     '3',
                      //     style: TextStyle(
                      //       fontFamily: mainFont,
                      //       color: Colors.black38,
                      //       fontSize: 10,
                      //     ),
                      //   ),
                      // ),
                    )
                  : const SizedBox(),
              Text(
                time.toString(),
                style: TextStyle(
                  fontFamily: mainFont,
                  color: Colors.black38,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          onTap: () {
            FirebaseFirestore.instance
                .collection('users')
                .doc(widget.user.uid)
                .collection('messages')
                .doc(msgId)
                .update({
              'label': false,
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PercakapanPage(
                          friend: receiver,
                          user: widget.user,
                          msgType: msgType,
                          isDone: false,
                          msgId: msgId,
                          isConsultant: true,
                        )));
          },
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

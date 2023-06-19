import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';

class BaruConsultant extends StatefulWidget {
  final UserModel user;
  const BaruConsultant({super.key, required this.user});

  @override
  State<BaruConsultant> createState() => _BaruConsultantState();
}

class _BaruConsultantState extends State<BaruConsultant> {
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collectionGroup('messages').snapshots(),
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
                  var msgId = snapshot.data!.docs[index].id;
                  var senderId = snapshot.data!.docs[index]['senderId'];
                  return msgStatus == 'new'
                      ? containerListTile(
                          msgType,
                          lastMsg,
                          msgType == 'Anonymous'
                              ? 'https://cdn-icons-png.flaticon.com/512/180/180691.png'
                              : widget.user.image,
                          '',
                          msgId,
                          msgType,
                          senderId,
                        )
                      : const SizedBox();
                });
          }
        } else {
          return const LinearProgressIndicator(
            color: Colors.transparent,
            backgroundColor: Colors.transparent,
            minHeight: 1,
          );
        }
      },
    );
  }

  Widget containerListTile(String nama, String lastMsg, String imageUrl,
      var receiver, String msgId, String msgType, String senderId) {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '08:37',
                  style: TextStyle(
                    fontFamily: mainFont,
                    color: Colors.black38,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Ambil konsultasi ini?',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.user.uid)
                            .collection('messages')
                            .doc(msgId)
                            .collection('chats')
                            .add({
                          'senderId': senderId,
                          'receiverId': widget.user.uid,
                          'message': lastMsg,
                          'date': DateTime.now(),
                        }).then((value) => {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(widget.user.uid)
                                      .collection('messages')
                                      .doc(msgId)
                                      .set({
                                    'last_msg': lastMsg,
                                    'senderId': senderId,
                                    'status': 'on',
                                    'type': msgType,
                                    'receiverId': widget.user.uid
                                  })
                                });
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(senderId)
                            .collection('messages')
                            .doc(msgId)
                            .collection('chats')
                            .add({
                          'senderId': senderId,
                          'receiverId': widget.user.uid,
                          'message': lastMsg,
                          'date': DateTime.now(),
                        }).then(
                          (value) => {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(senderId)
                                .collection('messages')
                                .doc(msgId)
                                .update({
                              'status': 'on',
                              'receiverId': widget.user.uid,
                            })
                          },
                        );
                        Navigator.pop(context, 'OK');
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
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

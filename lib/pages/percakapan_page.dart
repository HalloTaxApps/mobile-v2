// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class PercakapanPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final friend;
  final UserModel user;
  final bool isDone;
  final String? msgType;
  final String? msgId;
  final bool isConsultant;
  const PercakapanPage({
    super.key,
    required this.friend,
    this.isDone = false,
    required this.user,
    this.msgType,
    this.msgId,
    this.isConsultant = false,
  });

  @override
  State<PercakapanPage> createState() => _PercakapanPageState();
}

class _PercakapanPageState extends State<PercakapanPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';
  late bool isDone = widget.isDone;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    CircleAvatar(
                      radius: 21,
                      backgroundImage: NetworkImage(widget.msgType ==
                                  'Anonymous' &&
                              widget.friend['role'] == 'Customer'
                          ? 'https://cdn-icons-png.flaticon.com/512/180/180691.png'
                          : widget.friend['image']),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        widget.msgType == 'Anonymous' &&
                                widget.friend['role'] == 'Customer'
                            ? 'Anonymous'
                            : widget.friend['name'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    widget.isConsultant
                        ? IconButton(
                            onPressed: () {
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
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
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
                                            .doc(widget.friend.id)
                                            .collection('messages')
                                            .doc(widget.msgId)
                                            .update({
                                          'status': 'done',
                                        });
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(widget.user.uid)
                                            .collection('messages')
                                            .doc(widget.msgId)
                                            .delete();
                                        setState(() {
                                          isDone = true;
                                        });
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
                            },
                            icon: const Icon(
                              Icons.power_settings_new,
                              color: Colors.red,
                              size: 30,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.user.uid)
                            .collection('messages')
                            .doc(widget.msgId)
                            .collection('chats')
                            .orderBy('date', descending: true)
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.docs.length < 1) {
                              return const Center(
                                child: Text('No Messages'),
                              );
                            }
                            return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              reverse: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                bool isMe = snapshot.data.docs[index]
                                        ['senderId'] ==
                                    widget.user.uid;
                                var time = snapshot.data!.docs[index]['date'];
                                var dateTime =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        time.millisecondsSinceEpoch);
                                var dateFormat =
                                    DateFormat('k:mm').format(dateTime);
                                return singleMessage(
                                  isMe,
                                  snapshot.data.docs[index]['message'],
                                  dateFormat,
                                );
                              },
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(color: Colors.white),
                child: isDone ? isDoneFunction() : customTextfield(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row singleGroupMessages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Yesterday',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: mainFont,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Row singleMessage(bool isMe, String message, var time) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          constraints: const BoxConstraints(maxWidth: 240),
          decoration: BoxDecoration(
            color:
                isMe ? const Color.fromRGBO(253, 205, 136, 1) : Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: mainFont,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.black38,
                  fontFamily: mainFont,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget customTextfield() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(253, 205, 136, 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "Ketik Pesan...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // const SizedBox(
          //   width: 5,
          // ),
          // Container(
          //   height: 40,
          //   constraints: const BoxConstraints(maxWidth: 40),
          //   padding: const EdgeInsets.all(0),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(40),
          //   ),
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.add,
          //       color: mainColor.withOpacity(0.75),
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            constraints: const BoxConstraints(maxWidth: 40),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              onPressed: () async {
                String message = controller.text;
                controller.clear();
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.user.uid)
                    .collection('messages')
                    .doc(widget.msgId)
                    .collection('chats')
                    .add({
                  'senderId': widget.user.uid,
                  'receiverId': widget.friend['uid'],
                  'message': message,
                  'date': DateTime.now(),
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.user.uid)
                      .collection('messages')
                      .doc(widget.msgId)
                      .update({
                    'last_msg': message,
                    'last_msg_time': DateTime.now(),
                    'label': false,
                  });
                });
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.friend['uid'])
                    .collection('messages')
                    .doc(widget.msgId)
                    .collection('chats')
                    .add({
                  'senderId': widget.user.uid,
                  'receiverId': widget.friend['uid'],
                  'message': message,
                  'type': 'text',
                  'date': DateTime.now(),
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.friend['uid'])
                      .collection('messages')
                      .doc(widget.msgId)
                      .update({
                    'last_msg': message,
                    'last_msg_time': DateTime.now(),
                    'label': true,
                  });
                });

                var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

                Map data = {
                  "to": widget.friend['fcmToken'],
                  "notification": {
                    "title": widget.user.name,
                    "body": message,
                  },
                  "data": {
                    "title": widget.user.name,
                    "body": message,
                  }
                };

                var body = jsonEncode(data);

                Map<String, String> headers = {
                  'Content-type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization':
                      'key=AAAAaOuFdj4:APA91bHL6gHGTlYvEr4KiIiHvwIcjVmwXZA_BsIy76a9OVq1X3x4dZ5fyajHquFvP1HNS9c54vTYBG3wRiXVUfSdj405nUmmbm1OPbjKr_AAXExUpYKXw9cmH3SyIwuqBYm9CO8l__at'
                };

                var response = await http.post(
                  url,
                  headers: headers,
                  body: body,
                );

                print('response = $response');
              },
              icon: Icon(
                Icons.send,
                color: mainColor.withOpacity(0.75),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget isDoneFunction() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(253, 205, 136, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Sesi chat telah berakhir. Jika butuh bantuan lebih lanjut, silahkan memulai konsultasi kembali.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Sesi chat dengan konsultan berakhir',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

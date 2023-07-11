import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:hallotaxv2/pages/statuschat_page.dart';

class ChatPage extends StatefulWidget {
  final UserModel user;
  final String formerPage;
  const ChatPage({super.key, required this.user, required this.formerPage});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';
  final TextEditingController controller = TextEditingController();
  late List<String> status = [widget.user.name, 'Anonymous'];
  late String dropDownStatus = status.first;

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
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Mulai Konsultasi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Row(
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
                      ],
                    ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'Krim Pesan Untuk Memulai Konsultasi',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Container(
                        //     width: 150,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(
                        //         color: mainColor,
                        //         width: 1,
                        //       ),
                        //     ),
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton(
                        //         value: dropDownStatus,
                        //         icon: const Icon(Icons.arrow_drop_down),
                        //         elevation: 16,
                        //         items: status
                        //             .map<DropdownMenuItem<String>>(
                        //                 (value) => DropdownMenuItem<String>(
                        //                     value: value,
                        //                     child: SizedBox(
                        //                       width: 100,
                        //                       child: Text(
                        //                         value,
                        //                         style: const TextStyle(
                        //                           color: Colors.black,
                        //                           fontSize: 16,
                        //                           overflow:
                        //                               TextOverflow.ellipsis,
                        //                         ),
                        //                       ),
                        //                     )))
                        //             .toList(),
                        //         onChanged: (value) {
                        //           setState(() {
                        //             dropDownStatus = value.toString();
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.33,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Mulai konsultasi anda',
                              hintStyle: TextStyle(
                                fontFamily: mainFont,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () async {
                                String message = controller.text;
                                controller.clear();
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(widget.user.uid)
                                    .collection('messages')
                                    .add({
                                  'status': 'new',
                                  'type': dropDownStatus,
                                  'last_msg': message,
                                  'senderId': widget.user.uid,
                                  'receiverId': '',
                                  'label': true,
                                  'last_msg_time': DateTime.now(),
                                });
                                if (widget.formerPage == 'home') {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StatusChatPage(
                                                user: widget.user,
                                              )));
                                } else if (widget.formerPage == 'status') {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Kirim'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

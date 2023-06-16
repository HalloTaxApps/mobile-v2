import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:hallotaxv2/pages/chatstatus_page/baru_page.dart';
import 'package:hallotaxv2/pages/chatstatus_page/berlangsung_page.dart';
import 'package:hallotaxv2/pages/chatstatus_page/selesai_page.dart';

class StatusChatPage extends StatefulWidget {
  final UserModel user;
  const StatusChatPage({super.key, required this.user});

  @override
  State<StatusChatPage> createState() => _StatusChatPageState();
}

class _StatusChatPageState extends State<StatusChatPage> {
  late bool isNotif = true;
  late bool isBerlangsung = true;
  late bool isBaru = false;
  late bool isSelesai = false;
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';
  late Widget isiSection = BerlangsungPage(
    user: widget.user,
  );

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
                          'Inbox',
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
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: mainColor,
                                size: 40,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: mainColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: mainColor, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isBaru = false;
                                  isBerlangsung = true;
                                  isSelesai = false;
                                  isiSection = BerlangsungPage(
                                    user: widget.user,
                                  );
                                });
                              },
                              child: Stack(
                                children: [
                                  Text(
                                    'Berlangsung',
                                    style: TextStyle(
                                      color: isBerlangsung
                                          ? mainColor
                                          : Colors.black26,
                                    ),
                                  ),
                                  isNotif
                                      ? Row(
                                          children: const [
                                            SizedBox(
                                              width: 75,
                                            ),
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.red,
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isBaru = true;
                                  isBerlangsung = false;
                                  isSelesai = false;
                                  isiSection = BaruPage(
                                    user: widget.user,
                                  );
                                });
                              },
                              child: Text(
                                'Menunggu',
                                style: TextStyle(
                                  color: isBaru ? mainColor : Colors.black26,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isBaru = false;
                                  isBerlangsung = false;
                                  isSelesai = true;
                                  isiSection = SelesaiPage(
                                    user: widget.user,
                                  );
                                });
                              },
                              child: Text(
                                'Selesai',
                                style: TextStyle(
                                  color: isSelesai ? mainColor : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              isiSection,
                            ],
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

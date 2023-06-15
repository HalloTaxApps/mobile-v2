import 'package:flutter/material.dart';

class PercakapanPage extends StatefulWidget {
  const PercakapanPage({super.key});

  @override
  State<PercakapanPage> createState() => _PercakapanPageState();
}

class _PercakapanPageState extends State<PercakapanPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';
  bool isDone = false;
  final TextEditingController controller = TextEditingController();
  late List<String> status = ['Anonymous', 'Faiz'];
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
                    const CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        'Nur Faiz',
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
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(maxWidth: 240),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(253, 205, 136, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Halo Zayang, kamu kenapa? sini cerita sama aku',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: mainFont,
                                      fontSize: 16,
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '07:00',
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: mainFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(maxWidth: 240),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Halo Zayang, kamu kenapa? sini cerita sama aku',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: mainFont,
                                      fontSize: 16,
                                      overflow: TextOverflow.clip,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '07:00',
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontFamily: mainFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(color: Colors.white),
                child: isDone ? isDoneFunction() : customTextfield(),
              ),
            ],
          ),
        ],
      ),
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
              onPressed: () {},
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
            ),
          ),
        ),
      ],
    );
  }
}

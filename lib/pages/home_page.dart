import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';
import 'package:hallotaxv2/pages/berita_page.dart';
import 'package:hallotaxv2/pages/chat_page.dart';
import 'package:hallotaxv2/pages/edukasi_page.dart';
import 'package:hallotaxv2/pages/iklan_page.dart';
import 'package:hallotaxv2/pages/kontenedukasi_page.dart';
import 'package:hallotaxv2/pages/konteniklan_page.dart';
import 'package:hallotaxv2/pages/profil_page.dart';
import 'package:hallotaxv2/pages/statuschat_page.dart';
import 'package:hallotaxv2/pages/webview_page.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNotif = true;
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        user: widget.user,
                      )));
        },
        backgroundColor: mainColor,
        label: Text(
          'Mulai Konsultasi',
          style: TextStyle(
              fontFamily: mainFont, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Column(
            children: const [
              SizedBox(
                height: 130,
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        backgroundImage: NetworkImage(widget.user.image),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatusChatPage(
                                      user: widget.user,
                                    )));
                      },
                      splashColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: SizedBox(
                          // ignore: dead_code
                          height: isNotif ? 25 : 22,
                          child: Image(
                            image: AssetImage(isNotif
                                // ignore: dead_code
                                ? 'assets/images/MessageNotif.png'
                                // ignore: dead_code
                                : 'assets/images/Message.png'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Halo, ${widget.user.name}',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 25,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Rekomendasi Untuk Anda',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const IklanPage()));
                              },
                              child: Text(
                                'Selengkapnya',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  color: mainColor,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KontenIklanPage()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Cari Tahu Seputar Pajak',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EdukasiPage()));
                              },
                              child: Text(
                                'Selengkapnya',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  color: mainColor,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KontenEdukasiPage()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Berita Menarik',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BeritaPage()));
                              },
                              child: Text(
                                'Selengkapnya',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  color: mainColor,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebviewPage(
                                              judul: 'Berita $index',
                                              url: '')));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
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

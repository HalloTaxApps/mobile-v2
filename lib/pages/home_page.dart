import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/controllers/berita_controller.dart';
import 'package:hallotaxv2/controllers/edukasi_controller.dart';
import 'package:hallotaxv2/controllers/iklan_controller.dart';
import 'package:hallotaxv2/models/berita_model.dart';
import 'package:hallotaxv2/models/edukasi_model.dart';
import 'package:hallotaxv2/models/iklan_model.dart';
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

  List<BeritaModel> listBerita = [];
  BeritaController beritaController = BeritaController();
  List<IklanModel> listIklan = [];
  IklanController iklanController = IklanController();
  List<EdukasiModel> listEdukasi = [];
  EdukasiController edukasiController = EdukasiController();

  @override
  void initState() {
    getBerita();
    getIklan();
    getEdukasi();
    super.initState();
  }

  getBerita() async {
    listBerita = await beritaController.getBerita();
    setState(() {
      listBerita;
    });
  }

  getIklan() async {
    listIklan = await iklanController.getIklan();
    setState(() {
      listIklan;
    });
  }

  getEdukasi() async {
    listEdukasi = await edukasiController.getEdukasi();
    setState(() {
      listEdukasi;
    });
  }

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
                                backgroundImage:
                                    NetworkImage(userData['image']),
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
                            "Halo, ${userData['name']}",
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: listIklan.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      KontenIklanPage(
                                                        deskripsi:
                                                            listIklan[index]
                                                                .deskripsi,
                                                        info: listIklan[index]
                                                            .info,
                                                        judul: listIklan[index]
                                                            .judul,
                                                        listImageUrl: [
                                                          listIklan[index]
                                                              .imageUrl1,
                                                          listIklan[index]
                                                              .imageUrl2,
                                                          listIklan[index]
                                                              .imageUrl3,
                                                          listIklan[index]
                                                              .imageUrl4,
                                                          listIklan[index]
                                                              .imageUrl5,
                                                        ],
                                                        mitra: listIklan[index]
                                                            .mitra,
                                                        syarat: listIklan[index]
                                                            .syarat,
                                                        url: listIklan[index]
                                                            .url,
                                                      )));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black12,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                listIklan[index].imageUrl1,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          listIklan[index]
                                                              .judul,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                mainFont,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listEdukasi.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      KontenEdukasiPage(
                                                        deskripsi:
                                                            listEdukasi[index]
                                                                .deskripsi,
                                                        judul:
                                                            listEdukasi[index]
                                                                .judul,
                                                        konten:
                                                            listEdukasi[index]
                                                                .konten,
                                                        materi:
                                                            listEdukasi[index]
                                                                .materi,
                                                        tipe: listEdukasi[index]
                                                            .tipe,
                                                      )));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black12,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  listEdukasi[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          listEdukasi[index]
                                                              .judul,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                mainFont,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: listBerita.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebviewPage(
                                                        mitra: listBerita[index]
                                                            .mitra,
                                                        url: listBerita[index]
                                                            .url,
                                                      )));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black12,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  listBerita[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          listBerita[index]
                                                              .judul,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                mainFont,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: mainColor),
              );
            }
          }),
    );
  }
}

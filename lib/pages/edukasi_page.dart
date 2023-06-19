import 'package:flutter/material.dart';
import 'package:hallotaxv2/controllers/edukasi_controller.dart';
import 'package:hallotaxv2/models/edukasi_model.dart';
import 'package:hallotaxv2/pages/kontenedukasi_page.dart';

class EdukasiPage extends StatefulWidget {
  const EdukasiPage({super.key});

  @override
  State<EdukasiPage> createState() => _EdukasiPageState();
}

class _EdukasiPageState extends State<EdukasiPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  List<EdukasiModel> listEdukasi = [];
  EdukasiController edukasiController = EdukasiController();
  String judul = '';
  String imageUrl = '';
  String deskripsi = '';
  String materi = '';
  String konten = '';
  String tipe = '';

  @override
  void initState() {
    getEdukasi();
    super.initState();
  }

  getEdukasi() async {
    listEdukasi = await edukasiController.getEdukasi();
    setState(() {
      judul = listEdukasi[0].judul;
      imageUrl = listEdukasi[0].imageUrl;
      deskripsi = listEdukasi[0].deskripsi;
      materi = listEdukasi[0].materi;
      konten = listEdukasi[0].konten;
      tipe = listEdukasi[0].tipe;
    });
  }

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
                          'Cari Tahu Seputar Pajak',
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
                          height: 20,
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Text(
                                'Belajar Pajak',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              for (var i = 0; i < listEdukasi.length; i++)
                                if (listEdukasi[i].tipe == 'pajak')
                                  containerMateri(
                                    i,
                                    listEdukasi[i].judul,
                                    listEdukasi[i].deskripsi,
                                    listEdukasi[i].materi,
                                    listEdukasi[i].konten,
                                    listEdukasi[i].tipe,
                                  ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Belajar Pajak Lainnya',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              for (var i = 0; i < listEdukasi.length; i++)
                                if (listEdukasi[i].tipe == 'other')
                                  containerMateri(
                                    i,
                                    listEdukasi[i].judul,
                                    listEdukasi[i].deskripsi,
                                    listEdukasi[i].materi,
                                    listEdukasi[i].konten,
                                    listEdukasi[i].tipe,
                                  ),
                              const SizedBox(
                                height: 20,
                              ),
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

  Widget containerMateri(
    int index,
    String judul,
    String deskripsi,
    String materi,
    String konten,
    String tipe,
  ) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KontenEdukasiPage(
                        judul: judul,
                        deskripsi: deskripsi,
                        materi: materi,
                        konten: konten,
                        tipe: tipe,
                      )));
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              judul,
              style: TextStyle(
                fontFamily: mainFont,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
}

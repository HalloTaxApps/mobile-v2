import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/konteniklan_page.dart';
import 'package:hallotaxv2/controllers/iklan_controller.dart';
import 'package:hallotaxv2/models/iklan_model.dart';

class IklanPage extends StatefulWidget {
  const IklanPage({super.key});

  @override
  State<IklanPage> createState() => _IklanPageState();
}

class _IklanPageState extends State<IklanPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  List<IklanModel> listIklan = [];
  IklanController iklanController = IklanController();
  String mitra = '';
  String judul = '';
  String imageUrl1 = '';
  String imageUrl2 = '';
  String imageUrl3 = '';
  String imageUrl4 = '';
  String imageUrl5 = '';
  String deskripsi = '';
  String info = '';
  String syarat = '';
  String url = '';

  @override
  void initState() {
    getIklan();
    super.initState();
  }

  getIklan() async {
    listIklan = await iklanController.getIklan();
    setState(() {
      mitra = listIklan[0].mitra;
      judul = listIklan[0].judul;
      imageUrl1 = listIklan[0].imageUrl1;
      imageUrl2 = listIklan[0].imageUrl2;
      imageUrl3 = listIklan[0].imageUrl3;
      imageUrl4 = listIklan[0].imageUrl4;
      imageUrl5 = listIklan[0].imageUrl5;
      deskripsi = listIklan[0].deskripsi;
      info = listIklan[0].info;
      syarat = listIklan[0].syarat;
      url = listIklan[0].url;
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
                          'Rekomendasi Untuk Anda',
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KontenIklanPage(
                                          mitra: mitra,
                                          judul: judul,
                                          listImageUrl: [
                                            imageUrl1,
                                            imageUrl2,
                                            imageUrl3,
                                            imageUrl4,
                                            imageUrl5,
                                          ],
                                          deskripsi: deskripsi,
                                          info: info,
                                          syarat: syarat,
                                          url: url,
                                        )));
                          },
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl1),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 80,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            judul,
                                            style: TextStyle(
                                              fontFamily: mainFont,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        deskripsi,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: mainFont,
                                          color: Colors.black54,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Berbagai Layanan Tersedia Untuk Anda',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        for (var i = 1; i < listIklan.length; i++)
                          containerIklan(
                            listIklan[i].mitra,
                            listIklan[i].judul,
                            [
                              listIklan[i].imageUrl1,
                              listIklan[i].imageUrl2,
                              listIklan[i].imageUrl3,
                              listIklan[i].imageUrl4,
                              listIklan[i].imageUrl5,
                            ],
                            listIklan[i].deskripsi,
                            listIklan[i].info,
                            listIklan[i].syarat,
                            listIklan[i].url,
                          ),
                        const SizedBox(
                          height: 20,
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

  Widget containerIklan(
    String mitra,
    String judul,
    List<String> listImageUrl,
    String deskripsi,
    String info,
    String syarat,
    String url,
  ) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KontenIklanPage(
                        mitra: mitra,
                        judul: judul,
                        listImageUrl: listImageUrl,
                        deskripsi: deskripsi,
                        info: info,
                        syarat: syarat,
                        url: url,
                      )));
        },
        child: Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(listImageUrl[0]),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          judul,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        deskripsi,
                        style: TextStyle(
                          fontFamily: mainFont,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

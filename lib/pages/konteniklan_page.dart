import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/webview_page.dart';

class KontenIklanPage extends StatefulWidget {
  final String mitra;
  final String judul;
  final List<String> listImageUrl;
  final String deskripsi;
  final String info;
  final String syarat;
  final String url;
  const KontenIklanPage({
    super.key,
    required this.mitra,
    required this.judul,
    required this.listImageUrl,
    required this.deskripsi,
    required this.info,
    required this.syarat,
    required this.url,
  });

  @override
  State<KontenIklanPage> createState() => _KontenIklanPageState();
}

class _KontenIklanPageState extends State<KontenIklanPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 50,
        child: FittedBox(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebviewPage(
                            mitra: widget.mitra,
                            url: widget.url,
                          )));
            },
            backgroundColor: mainColor,
            label: Text(
              'Kunjungi Website',
              style: TextStyle(
                fontFamily: mainFont,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
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
                    Expanded(
                      child: Text(
                        widget.judul,
                        textAlign: TextAlign.left,
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
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.listImageUrl.length,
                          itemBuilder: (context, index) {
                            if (widget.listImageUrl[index] != '') {
                              return containerGambar(context, index,
                                  widget.judul, widget.listImageUrl[index]);
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deskripsi',
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.deskripsi,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Info Penting',
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.info,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Persyaratan',
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.syarat,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: mainFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
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

  Widget containerGambar(
      BuildContext context, index, String judul, String image) {
    return Container(
      margin: index == 0
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.only(right: 10),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      // child: Center(
      //   child: SizedBox(
      //     width: 100,
      //     child: Text(
      //       judul,
      //       maxLines: 2,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontFamily: mainFont,
      //         fontWeight: FontWeight.w700,
      //         color: Colors.black45,
      //         fontSize: 16,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

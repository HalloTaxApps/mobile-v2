import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/webview_page.dart';

class KontenIklanPage extends StatefulWidget {
  const KontenIklanPage({super.key});

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
                      builder: (context) => const WebviewPage(
                            judul: 'Paket Sewa Office',
                            url: 'https://grahaoffice.com/',
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
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Sewa Virtual Office',
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
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return containerGambar(context, index);
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
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae qui, inventore a nemo facilis, dignissimos quo, expedita laudantium doloribus cumque veniam quisquam minima? Vel aut exercitationem obcaecati iste, alias provident sit nostrum repellat laudantium accusamus molestiae corporis fuga rem praesentium quibusdam nesciunt eos aliquam beatae? Odit labore asperiores esse minus.',
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
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Veniam dolorem sit doloribus vero autem eaque quisquam voluptatum inventore labore! Atque.',
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
                              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea iusto nam ratione laboriosam tenetur nostrum quisquam quaerat blanditiis debitis esse architecto ullam asperiores sint culpa officia quod, omnis cum fugiat! Ipsa odit commodi architecto necessitatibus a neque laboriosam vitae molestias!',
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

  Widget containerGambar(BuildContext context, index) {
    return Container(
      margin: index == 0
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.only(right: 10),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SizedBox(
          width: 100,
          child: Text(
            'Layanan Graha Office',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: mainFont,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

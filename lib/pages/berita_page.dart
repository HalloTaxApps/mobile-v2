import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/webview_page.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

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
                          'Berita',
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
                                'Berita Populer',
                                style: TextStyle(
                                  fontFamily: mainFont,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const WebviewPage(
                                              judul: 'Ms. Puan on Speach',
                                              url:
                                                  'https://www.liputan6.com/tv/read/4972295/video-puan-maharani-hattrick-matikan-mikrofon-anggota-dewan-dalam-rapat-paripurna')));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://assets-studiohub.kompas.com/video2019/73f614858444241bddf143/26c5a38fce3e1024a73be40660c05eea/26c5a38fce3e1024a73be40660c05eea.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
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
                                                  'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed, numquam?',
                                                  style: TextStyle(
                                                    fontFamily: mainFont,
                                                    fontWeight: FontWeight.w700,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '08:30',
                                                style: TextStyle(
                                                  fontFamily: mainFont,
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quidem ea, distinctio voluptate delectus cupiditate deserunt minus debitis quod sapiente nemo.',
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
                              for (var i = 0; i < 5; i++) containerBerita(),
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

  Widget containerBerita() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WebviewPage(
                    judul: 'Ms. Puan on Speach',
                    url:
                        'https://www.liputan6.com/tv/read/4972295/video-puan-maharani-hattrick-matikan-mikrofon-anggota-dewan-dalam-rapat-paripurna')));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 120,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://assets-studiohub.kompas.com/video2019/73f614858444241bddf143/26c5a38fce3e1024a73be40660c05eea/26c5a38fce3e1024a73be40660c05eea.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab voluptatem reiciendis aspernatur maiores similique impedit iste, eligendi ea! Accusamus, autem.',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '08:30',
                    style: TextStyle(
                      fontFamily: mainFont,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti numquam blanditiis quod nostrum veritatis aut quidem dolores cum, et dolor odit autem sit. Natus quos modi laborum incidunt animi itaque eaque, error qui? Laudantium tempora sed repudiandae quae voluptas facilis!',
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: mainFont,
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

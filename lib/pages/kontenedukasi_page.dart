import 'package:flutter/material.dart';

class KontenEdukasiPage extends StatelessWidget {
  const KontenEdukasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
    String mainFont = 'Nunito';
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
                          'Cari Tahu Tentang Pajak',
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
                        Text(
                          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Exercitationem, dolorem?',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. At, nobis eum officia delectus quidem similique tempore aliquam vel unde rerum non itaque autem, nisi voluptate corrupti explicabo quos consequatur tenetur sunt commodi quam excepturi reprehenderit architecto blanditiis. Alias enim nulla corporis eius tenetur aliquam dolor optio consectetur repellat, officia beatae?',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: mainFont,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Exercitationem, dolorem?',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Exercitationem, dolorem?',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. At, nobis eum officia delectus quidem similique tempore aliquam vel unde rerum non itaque autem, nisi voluptate corrupti explicabo quos consequatur tenetur sunt commodi quam excepturi reprehenderit architecto blanditiis. Alias enim nulla corporis eius tenetur aliquam dolor optio consectetur repellat, officia beatae?',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: mainFont,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. At, nobis eum officia delectus quidem similique tempore aliquam vel unde rerum non itaque autem, nisi voluptate corrupti explicabo quos consequatur tenetur sunt commodi quam excepturi reprehenderit architecto blanditiis. Alias enim nulla corporis eius tenetur aliquam dolor optio consectetur repellat, officia beatae?',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: mainFont,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
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
}

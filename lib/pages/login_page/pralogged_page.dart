import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/consultant_page.dart';

import '../home_page.dart';

class PraloggedPage extends StatefulWidget {
  const PraloggedPage({super.key});

  @override
  State<PraloggedPage> createState() => _PraloggedPageState();
}

class _PraloggedPageState extends State<PraloggedPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/a/AGNmyxa-ldtJWPUt5-oFDoxjjYTvubJOYk3fKqoyIWG5HgM=s96-c'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Halo, Muhammad Nur Faiz',
              maxLines: 1,
              style: TextStyle(
                fontFamily: mainFont,
                fontWeight: FontWeight.w700,
                fontSize: 28,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Kamu punya highlight baru hari ini',
              maxLines: 1,
              style: TextStyle(
                fontFamily: mainFont,
                fontSize: 16,
                color: Colors.black54,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: index == 0
                      ? const EdgeInsets.only(left: 30, right: 10)
                      : const EdgeInsets.only(right: 10),
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index % 2 == 0 ? mainColor : Colors.grey,
                  ),
                );
              },
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsultantPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

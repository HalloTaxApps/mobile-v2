import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/home_page.dart';

class PralogginPage extends StatelessWidget {
  const PralogginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
    String mainFont = 'Nunito';
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: mainColor,
              child: const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/hallotaxlogo.png'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Halo, User',
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
              'Kamu punya masalah tentang pajak?',
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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(20),
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Let\'s Join Us',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: const Image(
                      image: AssetImage('assets/images/taxillustration.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: Text(
                      'Segala masalah pajak anda akan kami bantu selesaikan',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: mainFont,
                        fontSize: 16,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
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
                onPressed: () {},
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
                    'Daftar',
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontFamily: mainFont,
                    color: mainColor,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
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

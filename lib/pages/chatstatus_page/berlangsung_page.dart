import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/conversation_page.dart';

class BerlangsungPage extends StatefulWidget {
  const BerlangsungPage({super.key});

  @override
  State<BerlangsungPage> createState() => _BerlangsungPageState();
}

class _BerlangsungPageState extends State<BerlangsungPage> {
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future(() {
        return;
      }),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return isiDummy();
        } else {
          return Center(
            child: Column(
              children: [
                isiDummy(),
                isiDummy(),
                isiDummy(),
                isiDummy(),
                isiDummy(),
                isiDummy(),
                isiDummy(),
                isiDummy(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget isiDummy() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black12,
          ),
          title: Text(
            'Muhammad Nur Faiz',
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate, error.',
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '08:37',
                style: TextStyle(
                  fontFamily: mainFont,
                  color: Colors.black38,
                ),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontFamily: mainFont,
                      color: Colors.black38,
                    ),
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConversationPage()));
          },
        ),
      ),
    );
  }

  Column isiAsli() {
    return Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        Image(
          image: AssetImage('assets/images/nodata.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Data Berlangsung Kosong',
          style: TextStyle(
            color: Colors.black38,
            fontFamily: 'Nunito',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

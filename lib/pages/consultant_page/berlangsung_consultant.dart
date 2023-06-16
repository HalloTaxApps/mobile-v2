import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';

import '../percakapan_page.dart';

class BerlangsungConsultant extends StatefulWidget {
  final UserModel user;
  const BerlangsungConsultant({super.key, required this.user});

  @override
  State<BerlangsungConsultant> createState() => _BerlangsungConsultantState();
}

class _BerlangsungConsultantState extends State<BerlangsungConsultant> {
  final Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  final String mainFont = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        containerListTile(),
        containerListTile(),
      ],
    );
  }

  Widget containerListTile() {
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
            radius: 36,
            backgroundColor: Colors.black12,
          ),
          title: Text(
            'Muhammad Nur Faiz',
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate, error.',
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 12,
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
                  fontSize: 10,
                ),
              ),
              Container(
                width: 22,
                height: 22,
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
                      fontSize: 10,
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
                    builder: (context) => PercakapanPage(
                          friend: 'receiver',
                          user: widget.user,
                        )));
          },
        ),
      ),
    );
  }
}

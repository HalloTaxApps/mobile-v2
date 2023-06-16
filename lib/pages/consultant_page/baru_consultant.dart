import 'package:flutter/material.dart';

class BaruConsultant extends StatefulWidget {
  const BaruConsultant({super.key});

  @override
  State<BaruConsultant> createState() => _BaruConsultantState();
}

class _BaruConsultantState extends State<BaruConsultant> {
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
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Ambil konsultasi ini?',
                style: TextStyle(
                  fontFamily: mainFont,
                  fontWeight: FontWeight.w700,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

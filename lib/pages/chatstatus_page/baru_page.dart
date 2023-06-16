import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';

class BaruPage extends StatefulWidget {
  final UserModel user;
  const BaruPage({super.key, required this.user});

  @override
  State<BaruPage> createState() => _BaruPageState();
}

class _BaruPageState extends State<BaruPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future(() {
        return;
      }),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        } else {
          return Center(
            child: Column(
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
                  'Data Baru Kosong',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

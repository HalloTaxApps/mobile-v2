import 'package:flutter/material.dart';
import 'package:hallotaxv2/models/user_model.dart';

class SelesaiPage extends StatefulWidget {
  final UserModel user;
  const SelesaiPage({super.key, required this.user});

  @override
  State<SelesaiPage> createState() => _SelesaiPageState();
}

class _SelesaiPageState extends State<SelesaiPage> {
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
                  'Data Selesai Kosong',
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

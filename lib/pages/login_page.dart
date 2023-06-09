import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/login_page/pralogged_page.dart';
import 'package:hallotaxv2/pages/login_page/praloggin_page.dart';

import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userSignIn(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(251, 152, 12, 1),
              ),
            );
          }
        },
      ),
    );
  }

  Future<Widget> userSignIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      UserModel userModel = UserModel.fromJson(userData);
      return PraloggedPage(
        user: userModel,
      );
    } else {
      return const PralogginPage();
    }
  }
}

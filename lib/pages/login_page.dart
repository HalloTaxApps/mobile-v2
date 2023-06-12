import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/login_page/pralogged_page.dart';
// import 'package:hallotaxv2/pages/login_page/praloggin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dynamic _body = const PraloggedPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }
}

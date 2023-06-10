import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    String mainFont = 'Nunito';
    Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
    TextEditingController namaController = TextEditingController(text: '');
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController hpController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');
    TextEditingController roleController =
        TextEditingController(text: 'Customer');
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    width: 200,
                    child: Image(
                      image: AssetImage('assets/images/hallotaxlogo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Buat Akun',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, bottom: 5),
                          child: Text(
                            'Nama',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        customTextField(
                            controller: namaController, name: 'Nama'),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        customTextField(
                            controller: emailController, name: 'Email'),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'No. HP',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        customTextField(
                            controller: hpController, name: 'No. HP'),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        customTextField(
                            controller: passwordController,
                            name: 'Password',
                            isObscured: true),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Role',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        customTextField(
                            controller: roleController,
                            name: 'Role',
                            readOnly: true),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        // await googleSigninFunction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Atau',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        // await googleSigninFunction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 32,
                            width: 32,
                            child: Image(
                              image:
                                  AssetImage('assets/images/googleGlogo.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField customTextField(
          {bool isObscured = false,
          bool readOnly = false,
          required TextEditingController controller,
          required String name}) =>
      TextField(
        controller: controller,
        obscureText: isObscured,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: controller.text == ''
              ? Colors.transparent
              : Colors.grey.withOpacity(0.5),
          hintText: controller.text == '' ? 'Masukkan $name' : controller.text,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black38,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(251, 152, 12, 1),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(251, 152, 12, 1),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
}
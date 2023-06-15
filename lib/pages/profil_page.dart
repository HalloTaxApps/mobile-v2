import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/splash_screen.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);
  String mainFont = 'Nunito';
  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController hpController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController roleController =
      TextEditingController(text: 'Customer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bgillustration.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Akun',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Muhammad Nur Faiz',
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, bottom: 5),
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
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    backgroundColor: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                SizedBox(
                  height: 110,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/AGNmyxa-ldtJWPUt5-oFDoxjjYTvubJOYk3fKqoyIWG5HgM=s96-c',
                  ),
                ),
              ],
            ),
          )
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

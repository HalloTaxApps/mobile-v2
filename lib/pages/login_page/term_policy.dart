import 'package:flutter/material.dart';
import 'package:hallotaxv2/controllers/termsPolicy_controller.dart';
import 'package:hallotaxv2/models/termsPolicy_model.dart';

class TermPolicy extends StatefulWidget {
  const TermPolicy({super.key});

  @override
  State<TermPolicy> createState() => _TermPolicyState();
}

class _TermPolicyState extends State<TermPolicy> {
  String mainFont = 'Nunito';
  Color mainColor = const Color.fromRGBO(251, 152, 12, 1);

  List<TermsPolicyModel> listTermsPolicy = [];
  TermsPolicyController termsPolicyController = TermsPolicyController();
  String terms = '';
  String policy = '';

  @override
  void initState() {
    getTermsPolicy();
    super.initState();
  }

  getTermsPolicy() async {
    listTermsPolicy = await TermsPolicyController().getTermsPolicy();
    setState(() {
      terms = listTermsPolicy[0].terms;
      policy = listTermsPolicy[0].policy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'Syarat dan Kebijakan',
          style: TextStyle(
            fontFamily: mainFont,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listTermsPolicy.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Syarat:',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    listTermsPolicy[index].terms,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kebijakan:',
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    listTermsPolicy[index].policy,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: mainFont,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Setuju',
                        style: TextStyle(
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

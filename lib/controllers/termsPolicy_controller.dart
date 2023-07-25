// ignore_for_file: file_names

import 'dart:convert';
import 'package:hallotaxv2/models/termsPolicy_model.dart';
import 'package:http/http.dart' as http;

class TermsPolicyController {
  final url = Uri.parse('https://faiz-web.my.id/api/terms_policies');

  Future getTermsPolicy() async {
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);
        List<TermsPolicyModel> data =
            it.map((e) => TermsPolicyModel.fromJson(e)).toList();

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

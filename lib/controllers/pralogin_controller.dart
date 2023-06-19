import 'dart:convert';

import 'package:hallotaxv2/models/pralogin_model.dart';
import 'package:http/http.dart' as http;

class PraloginController {
  final url = Uri.parse('https://faiz-web.my.id/api/pralogins');

  Future getPralogin() async {
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);
        List<PraloginModel> data =
            it.map((e) => PraloginModel.fromJson(e)).toList();

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

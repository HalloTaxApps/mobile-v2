import 'dart:convert';

import 'package:hallotaxv2/models/iklan_model.dart';
import 'package:http/http.dart' as http;

class IklanController {
  final url = Uri.parse('http://10.0.2.2:8000/api/iklans');

  Future getIklan() async {
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);

        List<IklanModel> data = it.map((e) => IklanModel.fromJson(e)).toList();

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

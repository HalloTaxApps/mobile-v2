import 'dart:convert';

import 'package:hallotaxv2/models/edukasi_model.dart';
import 'package:http/http.dart' as http;

class EdukasiController {
  final url = Uri.parse('https://faiz-web.my.id/api/edukasis');

  Future getEdukasi() async {
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);
        List<EdukasiModel> data =
            it.map((e) => EdukasiModel.fromJson(e)).toList();

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

import 'dart:convert';

import 'package:hallotaxv2/models/berita_model.dart';
import 'package:http/http.dart' as http;

class BeritaController {
  final url = Uri.parse('https://faiz-web.my.id/api/beritas');

  Future getBerita() async {
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);
        List<BeritaModel> data =
            it.map((e) => BeritaModel.fromJson(e)).toList();

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

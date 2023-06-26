class BeritaModel {
  int id;
  String mitra;
  String judul;
  String imageUrl;
  String deskripsi;
  String url;

  BeritaModel({
    required this.id,
    required this.mitra,
    required this.judul,
    required this.imageUrl,
    required this.deskripsi,
    required this.url,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      mitra: json['mitra'],
      judul: json['judul'],
      imageUrl: json['imageUrl'],
      deskripsi: json['deskripsi'],
      url: json['url'],
    );
  }
}

// ElevatedButton(
                      //   onPressed: () async {
                      //     var url =
                      //         Uri.parse('http://10.0.2.2:8000/api/beritas');
                      //     var res = await http.get(url);
                      //     var data = jsonDecode(res.body);
                      //     print('isi res =  ${data[1]['name']}');
                      //   },
                      //   child: const Text('Tes API'),
                      // ),
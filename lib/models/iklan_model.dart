class IklanModel {
  int id;
  String mitra;
  String judul;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  String imageUrl4;
  String imageUrl5;
  String deskripsi;
  String info;
  String syarat;
  String url;

  IklanModel({
    required this.id,
    required this.mitra,
    required this.judul,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.deskripsi,
    required this.info,
    required this.syarat,
    required this.url,
  });

  factory IklanModel.fromJson(Map<String, dynamic> json) {
    return IklanModel(
      id: json['id'],
      mitra: json['mitra'],
      judul: json['judul'],
      imageUrl1: json['imageUrl1'],
      imageUrl2: json['imageUrl2'] ?? "",
      imageUrl3: json['imageUrl3'] ?? "",
      imageUrl4: json['imageUrl4'] ?? "",
      imageUrl5: json['imageUrl5'] ?? "",
      deskripsi: json['deskripsi'] ?? "",
      info: json['info'],
      syarat: json['syarat'],
      url: json['url'],
    );
  }
}

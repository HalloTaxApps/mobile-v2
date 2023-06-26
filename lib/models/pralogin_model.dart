class PraloginModel {
  int id;
  String judul;
  String imageUrl;
  String deskripsi;

  PraloginModel({
    required this.id,
    required this.judul,
    required this.imageUrl,
    required this.deskripsi,
  });

  factory PraloginModel.fromJson(Map<String, dynamic> json) {
    return PraloginModel(
      id: json['id'],
      judul: json['judul'],
      imageUrl: json['imageUrl'],
      deskripsi: json['deskripsi'],
    );
  }
}

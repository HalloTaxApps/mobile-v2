class EdukasiModel {
  int id;
  String judul;
  String imageUrl;
  String deskripsi;
  String materi;
  String konten;
  String tipe;

  EdukasiModel({
    required this.id,
    required this.judul,
    required this.imageUrl,
    required this.deskripsi,
    required this.materi,
    required this.konten,
    required this.tipe,
  });

  factory EdukasiModel.fromJson(Map<String, dynamic> json) {
    return EdukasiModel(
      id: json['id'],
      judul: json['judul'],
      imageUrl: json['imageUrl'],
      deskripsi: json['deskripsi'],
      materi: json['materi'],
      konten: json['konten'],
      tipe: json['tipe'],
    );
  }
}

// ignore_for_file: file_names

class TermsPolicyModel {
  int id;
  String terms;
  String policy;

  TermsPolicyModel({
    required this.id,
    required this.terms,
    required this.policy,
  });

  factory TermsPolicyModel.fromJson(Map<String, dynamic> json) {
    return TermsPolicyModel(
      id: json['id'],
      terms: json['terms'],
      policy: json['policy'],
    );
  }
}

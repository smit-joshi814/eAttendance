import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Batch {
  int id;
  String batchName;
  Batch({
    required this.id,
    required this.batchName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'batchName': batchName,
    };
  }

  factory Batch.fromMap(Map<String, dynamic> map) {
    return Batch(
      id: map['id'] as int,
      batchName: map['batchName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Batch.fromJson(String source) =>
      Batch.fromMap(json.decode(source) as Map<String, dynamic>);
}

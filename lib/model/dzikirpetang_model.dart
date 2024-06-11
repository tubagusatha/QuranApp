
import 'dart:convert';

List<Petang> PetangFromJson(String str) =>
    List<Petang>.from(json.decode(str).map((x) => Petang.fromJson(x)));

class Petang {
  String title;
  String arabic;
  String latin;
  String translation;
  String notes;
  String fawaid;
  String source;

  Petang({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.notes,
    required this.fawaid,
    required this.source,
  });

  factory Petang.fromJson(Map<String, dynamic> json) => Petang(title: json['title'], arabic: json['arabic'], latin: json['latin'], translation: json['translation'], notes: json['notes'], fawaid: json['fawaid'], source: json['source']);
}
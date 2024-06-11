
import 'dart:convert';

List<Pagi> PagiFromJson(String str) =>
    List<Pagi>.from(json.decode(str).map((x) => Pagi.fromJson(x)));

class Pagi {
  String title;
  String arabic;
  String latin;
  String translation;
  String notes;
  String fawaid;
  String source;

  Pagi({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.notes,
    required this.fawaid,
    required this.source,
  });

  factory Pagi.fromJson(Map<String, dynamic> json) => Pagi(title: json['title'], arabic: json['arabic'], latin: json['latin'], translation: json['translation'], notes: json['notes'], fawaid: json['fawaid'], source: json['source']);
}
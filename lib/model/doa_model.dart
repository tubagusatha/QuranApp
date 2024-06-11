
import 'dart:convert';

List<doa> doaFromJson(String str) =>
    List<doa>.from(json.decode(str).map((x) => doa.fromJson(x)));

class doa {
  String title;
  String arabic;
  String latin;
  String translation;
  dynamic notes;
  String fawaid;
  String source;

  doa({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.notes,
    required this.fawaid,
    required this.source,
  });

  factory doa.fromJson(Map<String, dynamic> json) => doa(title: json['title'], arabic: json['arabic'], latin: json['latin'], translation: json['translation'], notes: json['notes'], fawaid: json['fawaid'], source: json['source']);
}

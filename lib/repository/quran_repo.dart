import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:remake_quran_app/model/ayah_model.dart';
import 'package:remake_quran_app/model/doa_model.dart';
import 'package:remake_quran_app/model/dzikirpagi_model.dart';
import 'package:remake_quran_app/model/dzikirpetang_model.dart';
import 'package:remake_quran_app/model/surah_model.dart';


class QuranRepository {
  Future<List<surah>> getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  Future<List<doa>> getDoaList() async {
    String data = await rootBundle.loadString('assets/data/list-doa.json');
    return doaFromJson(data);
    
  }

  Future<List<Pagi>> getPagiList() async {
    String data = await rootBundle.loadString('assets/data/list-dzikir-pagi.json');
    return PagiFromJson(data);
  }

  Future<List<Petang>> getPetangList() async {
    String data = await rootBundle.loadString('assets/data/list-dzikir-petang.json');
    return PetangFromJson(data);
  }

  Future<AyahModel> getListAyah(String id_surah) async {
    String url =
      "https://equran.id/api/surat/$id_surah";

    final Response = await http.get(Uri.parse(url));

    if(Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("Error");
  }

  
}


  
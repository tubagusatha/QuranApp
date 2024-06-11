


import 'package:remake_quran_app/model/ayah_model.dart';
import 'package:remake_quran_app/repository/quran_repo.dart';

class AyahViewModel {
  final _repository = QuranRepository();
  Future<AyahModel> getListAyah(String id_surah) async {

    try{
      final Response = await _repository.getListAyah(id_surah);
      return Response;
    }catch (e) {
      print("error: $e");
      rethrow;
    }
    
  }
}
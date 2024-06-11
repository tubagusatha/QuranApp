

import 'package:remake_quran_app/model/surah_model.dart';
import 'package:remake_quran_app/repository/quran_repo.dart';

class SurahViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<surah>> getListSurah() async {
    return await _repository.getSurahList();
  } 
}






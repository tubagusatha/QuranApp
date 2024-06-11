import 'package:remake_quran_app/model/dzikirpagi_model.dart';
import 'package:remake_quran_app/model/dzikirpetang_model.dart';
import 'package:remake_quran_app/repository/quran_repo.dart';

class DzikirViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<Pagi>> getListPagi() async {
    return await _repository.getPagiList();
  } 

  Future<List<Petang>> getListPetang() async {
    return await _repository.getPetangList() ;
  }
  
}

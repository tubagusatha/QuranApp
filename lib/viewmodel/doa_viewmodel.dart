
import 'package:remake_quran_app/model/doa_model.dart';
import 'package:remake_quran_app/repository/quran_repo.dart';

class DoaViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<doa>> getListDoa() async {
    return await _repository.getDoaList();
  } 
}

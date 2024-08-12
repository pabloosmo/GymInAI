import '../../../core/data_state.dart';
import '../../domain/repositories/program_repository.dart';
import '../datasources/program_ia_api_service.dart';
import '../models/models.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramIaApiService _programIaApiService;
  ProgramRepositoryImpl(this._programIaApiService);

  @override
  Future<DataState<ProgramModel>> getProgram(String prompt) async {
    try {
      final ProgramModel? program =
          await _programIaApiService.getProgramModel(prompt);
      if (program != null) {
        return DataSuccess(program);
      } else {
        return DataFailed(Exception());
      }
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}

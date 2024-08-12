import '../../../core/data_state.dart';
import '../entities/entities.dart';

abstract class ProgramRepository {
  Future<DataState<ProgramEntity>> getProgram(String prompt);
}

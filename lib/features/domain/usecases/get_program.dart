import '../../../core/data_state.dart';
import '../../../core/usecase.dart';
import '../entities/entities.dart';
import '../repositories/program_repository.dart';

class GetProgramUseCase implements UseCase<DataState<ProgramEntity>, void> {
  final ProgramRepository _programRepository;
  GetProgramUseCase(this._programRepository);
  @override
  Future<DataState<ProgramEntity>> call({String? params}) {
    return _programRepository.getProgram(params!);
  }
}

import 'package:get_it/get_it.dart';

import 'features/data/datasources/program_ia_api_service.dart';
import 'features/data/repositories/program_repository_impl.dart';
import 'features/domain/repositories/program_repository.dart';
import 'features/domain/usecases/get_program.dart';
import 'features/presentation/provider/program/remote/remote_program.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // dependencies
  sl.registerSingleton<ProgramIaApiService>(
    ProgramIaApiServiceImpl(),
  );
  sl.registerSingleton<ProgramRepository>(
    ProgramRepositoryImpl(sl()),
  );

  // use cases
  sl.registerSingleton<GetProgramUseCase>(
    GetProgramUseCase(sl()),
  );

  // blocs
  sl.registerFactory<RemoteProgramBloc>(
    () => RemoteProgramBloc(sl()),
  );
}

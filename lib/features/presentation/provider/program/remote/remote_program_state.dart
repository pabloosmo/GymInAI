import 'package:equatable/equatable.dart';

import '../../../../domain/entities/entities.dart';

abstract class RemoteProgramState extends Equatable {
  final ProgramEntity? program;
  final Exception? exception;

  const RemoteProgramState({this.program, this.exception});

  @override
  List<Object> get props => [program!, exception!];
}

class RemoteProgramDefault extends RemoteProgramState {
  const RemoteProgramDefault();
}

class RemoteProgramLoading extends RemoteProgramState {
  const RemoteProgramLoading();
}

class RemoteProgramDone extends RemoteProgramState {
  const RemoteProgramDone(ProgramEntity program) : super(program: program);
}

class RemoteProgramError extends RemoteProgramState {
  const RemoteProgramError(Exception exception) : super(exception: exception);
}

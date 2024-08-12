import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data_state.dart';
import '../../../../domain/usecases/get_program.dart';
import 'remote_program.dart';

class RemoteProgramBloc extends Bloc<RemoteProgramEvent, RemoteProgramState> {
  final GetProgramUseCase _getProgramUseCase;
  RemoteProgramBloc(this._getProgramUseCase)
      : super(const RemoteProgramDefault()) {
    on<GetProgram>(onGetProgram);
    on<Restart>(onRestart);
  }

  final String jsonStructure = '''
    {
      "program_name": "Name of the program",
      "duration": "duration of the sessions",
      "frequency": "sessions per week",
      "level": "level of expertise of the user",
      "equipment": "available equipment to train",
      "sessions": [
        {
          "day": "day of the week",
          "focus": "muscular group we work with",
          "exercises": [
            {
              "name": "name of the exercise",
              "sets": number of sets,
              "reps": "range of repetitions",
              "rest": "time to rest between sets",
            },
            ...
          ]
        },
        ...
      ],
      "notes": [
        "note about warm up",
        ...
      ]
    }
  ''';

  void onGetProgram(GetProgram event, Emitter<RemoteProgramState> emit) async {
    emit(const RemoteProgramLoading());
    String prompt =
        'I need a training program in JSON format with no explanation following the next rules:';
    //build the prompt
    if (event.sessionPerWeek == 1) {
      prompt = '$prompt three sessions per week,';
    } else if (event.sessionPerWeek == 2) {
      prompt = '$prompt four sessions per week,';
    } else if (event.sessionPerWeek == 3) {
      prompt = '$prompt five sessions per week,';
    } else if (event.sessionPerWeek == 4) {
      prompt = '$prompt six sessions per week,';
    }
    if (event.timePerSession == 1) {
      prompt = '$prompt duration of 1 hour,';
    } else if (event.timePerSession == 2) {
      prompt = '$prompt duration of 1 hour 30 minutes,';
    } else if (event.timePerSession == 3) {
      prompt = '$prompt duration of 2 hours,';
    }
    if (event.equipment == 1) {
      prompt = '$prompt with no equipment,';
    } else if (event.equipment == 2) {
      prompt = '$prompt at a calisthenics park,';
    } else if (event.equipment == 3) {
      prompt = '$prompt at a full equipped gym,';
    }
    if (event.experience == 1) {
      prompt = '$prompt for someone with no experience.';
    } else if (event.experience == 2) {
      prompt = '$prompt for someone with some experience.';
    } else if (event.experience == 3) {
      prompt = '$prompt for someone with experience.';
    }

    prompt =
        '$prompt The JSON must have the following structure, respecting String values: $jsonStructure';

    final dataState = await _getProgramUseCase.call(params: prompt);
    if (dataState is DataSuccess) {
      emit(RemoteProgramDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(
        RemoteProgramError(dataState.error!),
      );
    }
  }

  void onRestart(Restart event, Emitter<RemoteProgramState> emit) {
    emit(const RemoteProgramDefault());
  }
}

abstract class RemoteProgramEvent {
  const RemoteProgramEvent();
}

class GetProgram extends RemoteProgramEvent {
  final int? sessionPerWeek;
  final int? timePerSession;
  final int? equipment;
  final int? experience;

  const GetProgram(
    this.sessionPerWeek,
    this.timePerSession,
    this.equipment,
    this.experience,
  );
}

class Restart extends RemoteProgramEvent {}

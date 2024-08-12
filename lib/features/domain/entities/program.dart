import 'package:equatable/equatable.dart';

import 'entities.dart';

class ProgramEntity extends Equatable {
  final String? programName;
  final String? duration;
  final String? frequency;
  final String? level;
  final String? equipment;
  final List<DayEntity>? sessions;
  final List<String>? notes;

  const ProgramEntity({
    this.programName,
    this.duration,
    this.frequency,
    this.level,
    this.equipment,
    this.sessions,
    this.notes,
  });

  @override
  List<Object?> get props {
    return [
      programName,
      duration,
      frequency,
      level,
      equipment,
      sessions,
      notes,
    ];
  }
}

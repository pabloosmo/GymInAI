import 'dart:convert';

import '../../domain/entities/entities.dart';
import 'models.dart';

ProgramModel programModelFromJson(String str) =>
    ProgramModel.fromJson(json.decode(str));

class ProgramModel extends ProgramEntity {
  const ProgramModel({
    super.programName,
    super.duration,
    super.frequency,
    super.level,
    super.equipment,
    List<DayModel>? super.sessions,
    super.notes,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> map) => ProgramModel(
      programName: map['program_name'] ?? 'random program name',
      duration: map['duration'] ?? '',
      frequency: map['frequency'] ?? '',
      level: map['level'] ?? '',
      equipment: map['equipment'] ?? '',
      sessions: map['sessions'] == null
          ? null
          : List<DayModel>.from(
              map['sessions']!.map(
                (x) => DayModel.fromJson(x),
              ),
            ),
      notes: map['notes'] == null
          ? null
          : List<String>.from(map['notes']!.map((x) => x)));
}

import 'entities.dart';
import 'package:equatable/equatable.dart';

class DayEntity extends Equatable {
  final String? day;
  final String? focus;
  final List<ExerciseEntity>? exercises;

  const DayEntity({
    this.day,
    this.focus,
    this.exercises,
  });

  @override
  List<Object?> get props {
    return [
      day,
      focus,
      exercises,
    ];
  }
}

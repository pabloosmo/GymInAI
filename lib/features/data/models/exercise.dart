import '../../domain/entities/entities.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel({
    super.name,
    super.sets,
    super.reps,
    super.rest,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] ?? '',
      sets: map['sets'] ?? '',
      reps: map['reps'] ?? '',
      rest: map['rest'] ?? '',
    );
  }
}

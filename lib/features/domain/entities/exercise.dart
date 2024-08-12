import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String? name;
  final int? sets;
  final String? reps;
  final String? rest;

  const ExerciseEntity({
    this.name,
    this.sets,
    this.reps,
    this.rest,
  });

  @override
  List<Object?> get props {
    return [
      name,
      sets,
      reps,
    ];
  }
}

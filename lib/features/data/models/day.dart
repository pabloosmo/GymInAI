import '../../domain/entities/entities.dart';
import 'models.dart';

class DayModel extends DayEntity {
  const DayModel({
    super.day,
    super.focus,
    List<ExerciseModel>? super.exercises,
  });

  factory DayModel.fromJson(Map<String, dynamic> map) {
    return DayModel(
      day: map['day'],
      focus: map['focus'],
      exercises: map['exercises'] == null
          ? null
          : List<ExerciseModel>.from(
              map['exercises']!.map(
                (x) => ExerciseModel.fromJson(x),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/program/remote/remote_program.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _index = 0;
  int? _sessionsPerWeek;
  int? _sessionsDuration;
  int? _sessionsEquipment;
  int? _sessionsExperience;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < 3) {
          setState(() {
            _index += 1;
          });
        } else {
          context.read<RemoteProgramBloc>().add(GetProgram(
                _sessionsPerWeek,
                _sessionsDuration,
                _sessionsEquipment,
                _sessionsExperience,
              ));
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Sessions per week'),
          stepStyle: _index == 0
              ? const StepStyle(
                  color: Colors.deepOrange,
                )
              : null,
          content: Column(
            children: [
              RadioListTile(
                title: const Text('3 Sessions'),
                value: 1,
                groupValue: _sessionsPerWeek,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsPerWeek = 1;
                  });
                },
              ),
              RadioListTile(
                title: const Text('4 Sessions'),
                value: 2,
                groupValue: _sessionsPerWeek,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsPerWeek = 2;
                  });
                },
              ),
              RadioListTile(
                title: const Text('5 Sessions'),
                value: 3,
                groupValue: _sessionsPerWeek,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsPerWeek = 3;
                  });
                },
              ),
              RadioListTile(
                title: const Text('6 Sessions'),
                value: 4,
                groupValue: _sessionsPerWeek,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsPerWeek = 4;
                  });
                },
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Time per session'),
          stepStyle: _index == 1
              ? const StepStyle(
                  color: Colors.deepOrange,
                )
              : null,
          content: Column(
            children: [
              RadioListTile(
                title: const Text('1 hour'),
                value: 1,
                groupValue: _sessionsDuration,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsDuration = 1;
                  });
                },
              ),
              RadioListTile(
                title: const Text('1 hour 30 minutes'),
                value: 2,
                groupValue: _sessionsDuration,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsDuration = 2;
                  });
                },
              ),
              RadioListTile(
                title: const Text('2 hours'),
                value: 3,
                groupValue: _sessionsDuration,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsDuration = 3;
                  });
                },
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Equipment'),
          stepStyle: _index == 2
              ? const StepStyle(
                  color: Colors.deepOrange,
                )
              : null,
          content: Column(
            children: [
              RadioListTile(
                title: const Text('No equipment/At home'),
                value: 1,
                groupValue: _sessionsEquipment,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsEquipment = 1;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Calisthenics park'),
                value: 2,
                groupValue: _sessionsEquipment,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsEquipment = 2;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Full equipped gym'),
                value: 3,
                groupValue: _sessionsEquipment,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsEquipment = 3;
                  });
                },
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Experience'),
          stepStyle: _index == 3
              ? const StepStyle(
                  color: Colors.deepOrange,
                )
              : null,
          content: Column(
            children: [
              RadioListTile(
                title: const Text('Just PE at school'),
                value: 1,
                groupValue: _sessionsExperience,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsExperience = 1;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Some time ago'),
                value: 2,
                groupValue: _sessionsExperience,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsExperience = 2;
                  });
                },
              ),
              RadioListTile(
                title: const Text('I can shred this app'),
                value: 3,
                groupValue: _sessionsExperience,
                onChanged: (int? value) {
                  setState(() {
                    _sessionsExperience = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

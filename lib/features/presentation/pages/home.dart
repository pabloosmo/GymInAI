import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/program/remote/remote_program.dart';
import '../widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<RemoteProgramBloc, RemoteProgramState>(
      builder: (context, state) {
        if (state is RemoteProgramDone) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 36,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.program?.programName ?? 'No title',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade600,
                  child: SizedBox(
                    height: 96,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.program?.frequency ?? 'No frequency',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Text(
                              state.program?.duration ?? 'No duration',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Text(
                              state.program?.level ?? 'No level',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.program?.sessions?.length ?? 0,
                    itemBuilder: (_, sessionIndex) {
                      final currentSession =
                          state.program?.sessions?[sessionIndex];
                      return ExpansionTile(
                        title: Text(
                          '${currentSession?.day ?? 'Any day'}: ${currentSession?.focus ?? 'Full body'}',
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: currentSession?.exercises?.length ?? 0,
                            itemBuilder: (_, exerciseIndex) {
                              final currentExercise =
                                  currentSession?.exercises?[exerciseIndex];
                              return ListTile(
                                title: Text(
                                  currentExercise?.name ??
                                      'You already know this one',
                                ),
                                subtitle: Text(
                                    'Sets: ${currentExercise?.sets ?? 3} - Reps: ${currentExercise?.reps ?? 10}'),
                                trailing:
                                    Text(currentExercise?.rest ?? '1 min'),
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
                const AdviceCards(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<RemoteProgramBloc>().add(Restart());
                    },
                    child: const Text('Start new program!'),
                  ),
                )
              ],
            ),
          );
        } else if (state is RemoteProgramLoading) {
          return const CustomLoading();
        } else {
          return const CustomStepper();
        }
      },
    );
  }
}

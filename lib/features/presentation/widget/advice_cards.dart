import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/program/remote/remote_program.dart';

class AdviceCards extends StatefulWidget {
  const AdviceCards({super.key});

  @override
  State<AdviceCards> createState() => _AdviceCardsState();
}

class _AdviceCardsState extends State<AdviceCards> {
  int _pos = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteProgramBloc, RemoteProgramState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          if (_pos == state.program!.notes!.length - 1) {
            setState(() {
              _pos = 0;
            });
          } else {
            setState(() {
              _pos++;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.program?.notes?[_pos] ?? 'You can do it!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    });
  }
}

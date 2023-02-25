import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/ui/widgets/icon_button.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final SingleTimer store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Visibility(
          visible: store.workTime.wasStarted,
          replacement: TimerIconButton(
            onTap: store.start,
          ),
          child: TimerIconButton(
            icon: Icons.pause,
            onTap: store.stop,
          ),
        );
      },
    );
  }
}

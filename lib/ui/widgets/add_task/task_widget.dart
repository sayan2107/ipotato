import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/ui/widgets/home/start_pause_button.dart';
import 'package:ipotato_timer/ui/widgets/icon_button.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
    this.timer, {
    Key? key,
    this.onTapFinish,
  }) : super(key: key);

  final SingleTimer timer;
  final VoidCallback? onTapFinish;

  @override
  Widget build(BuildContext context) {
    final SingleTimer store = Provider.of<MultiTimer>(context)
        .timers
        .firstWhere((element) => element.timeStamp == timer.timeStamp);

    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (store.workTime.wasCompleted)
                      Center(child: Text("I am done"))
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(timer.time),
                          const SizedBox(width: 4),
                          StartPauseButton(store: store),
                          const SizedBox(width: 4),
                          TimerIconButton(
                            onTap: onTapFinish,
                            icon: Icons.stop,
                          ),
                        ],
                      ),
                    Text(timer.title),
                    Text(timer.description)
                  ],
                ),
              ),
              Visibility(
                visible: store.workTime.wasCompleted,
                child:
                    InkWell(onTap: onTapFinish, child: Text('mark completed')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

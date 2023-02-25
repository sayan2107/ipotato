import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/constants/colors.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/ui/add_task/addTask.dart';
import 'package:ipotato_timer/widgets/home/task_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MultiTimer>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
        backgroundColor: AppColors.green,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const AddTaskScreen();
              });
        },
        tooltip: 'Add',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 1),
          ),
          child: const Icon(Icons.add),
        ),
      ),
      body: Observer(
        builder: (_) => ListView(
          children: store.timers.reversed
              .map(
                (element) => TaskWidget(
                  element,
                  onTapFinish: () {
                    int index = store.timers.indexWhere(
                        (item) => item.timeStamp == element.timeStamp);
                    store.removeTimer(index);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

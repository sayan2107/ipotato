import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/constants/strings.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';
import 'package:ipotato_timer/theme/colors.dart';
import 'package:ipotato_timer/ui/add_task/add_task.dart';
import 'package:ipotato_timer/widgets/home/no_timer_widget.dart';
import 'package:ipotato_timer/widgets/home/task_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MultiTimer>(context);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        titleSpacing: 25,
        title: Text(
          Strings.homeAppbarTitle,
          style: AppTextTheme.of(context).h1.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const NoTimerWidget(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: _addTimerButton(),
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (_) => ListView(
          children: _sortList(store.timers.reversed.toList())
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

  List<SingleTimer> _sortList(List<SingleTimer> data) {
    return data
      ..sort((a, b) {
        if (b.workTime.wasCompleted) {
          return 1;
        }
        return -1;
      });
  }

  Widget _addTimerButton() {
    return Builder(
      builder: (BuildContext context) => FloatingActionButton(
        elevation: 2,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const FractionallySizedBox(
                  heightFactor: 0.9,
                  child: AddTaskScreen(),
                );
              });
        },
        tooltip: 'Add',
        backgroundColor: AppColors.sky,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 1),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

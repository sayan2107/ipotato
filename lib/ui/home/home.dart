import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipotato_timer/constants/colors.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';
import 'package:ipotato_timer/ui/add_task/add_task.dart';
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
          'Potato Timer',
          style: AppTextTheme.of(context).h1.copyWith(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            ListView(
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
            Positioned(
              right: 30,
              bottom: 120,
              child: Visibility(
                visible: store.timers.isEmpty,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No timers active",
                          style: AppTextTheme.of(context).h5,
                        ),
                        Text(
                          'Press here to start a new',
                          style: AppTextTheme.of(context).h5,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/images/arrow.svg',
                      width: 105,
                      height: 105,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 55,
              right: 30,
              child: FloatingActionButton(
                elevation: 2,
                shape: const CircleBorder(),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddTaskScreen();
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
            ),
          ],
        ),
      ),
    );
  }
}

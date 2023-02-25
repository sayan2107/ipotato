import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/constants/colors.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';
import 'package:ipotato_timer/widgets/home/start_pause_button.dart';
import 'package:ipotato_timer/widgets/icon_button.dart';
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
          color: AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (store.workTime.wasCompleted)
                      const FinishedWidget()
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            timer.time,
                            style: AppTextTheme.of(context)
                                .h1
                                .copyWith(color: AppColors.darkBlue),
                          ),
                          const SizedBox(width: 10),
                          StartPauseButton(store: store),
                          const SizedBox(width: 8),
                          TimerIconButton(
                            onTap: onTapFinish,
                            icon: Icons.stop,
                          ),
                        ],
                      ),
                    Text(
                      timer.title,
                      style: AppTextTheme.of(context)
                          .h2
                          .copyWith(color: AppColors.darkGreen),
                    ),
                    Text(
                      timer.description,
                      style: AppTextTheme.of(context).h5.copyWith(
                          color: AppColors.darkBlue, letterSpacing: 0.25),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: store.workTime.wasCompleted,
                child: MarkCompletedButton(
                  onTap: onTapFinish,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FinishedWidget extends StatelessWidget {
  const FinishedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getWaveIcon(),
        Text(
          'Finished'.toUpperCase(),
          style:
              AppTextTheme.of(context).h1.copyWith(color: AppColors.darkBlue),
        ),
        _getWaveIcon(),
      ],
    );
  }

  Widget _getWaveIcon() {
    return SvgPicture.asset(
      'assets/images/sound_wave.svg',
      width: 24,
      height: 24,
    );
  }
}

class MarkCompletedButton extends StatelessWidget {
  const MarkCompletedButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.lightPurple),
        ),
        onPressed: onTap,
        child: Text(
          "mark completed".toUpperCase(),
          style: AppTextTheme.of(context).h6.copyWith(
              letterSpacing: 0.5,
              color: AppColors.darkestBlue,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

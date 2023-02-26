import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';

class NoTimerWidget extends StatelessWidget {
  const NoTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
        const SizedBox(width: 10),
        SvgPicture.asset(
          'assets/images/arrow.svg',
          width: 105,
          height: 105,
        )
      ],
    );
  }
}

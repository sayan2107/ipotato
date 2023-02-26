import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/constants/assets.dart';
import 'package:ipotato_timer/constants/strings.dart';
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
              Strings.noActiveTimerText,
              style: AppTextTheme.of(context).h5,
            ),
            Text(
              Strings.pressHereToStartText,
              style: AppTextTheme.of(context).h5,
            )
          ],
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          Assets.largeArrow,
          width: 105,
          height: 105,
        )
      ],
    );
  }
}

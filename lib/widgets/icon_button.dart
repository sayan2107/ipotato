import 'package:flutter/material.dart';
import 'package:ipotato_timer/theme/colors.dart';

class TimerIconButton extends StatelessWidget {
  const TimerIconButton({
    Key? key,
    this.onTap,
    this.icon = Icons.play_arrow,
  }) : super(key: key);

  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

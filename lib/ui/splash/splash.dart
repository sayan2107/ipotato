import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/egg_large.svg',
            width: 235,
            height: 235,
          ),
          const SizedBox(height: 40),
          SvgPicture.asset(
            'assets/images/splash_title.svg',
          ),
        ],
      ),
    ));
  }
}

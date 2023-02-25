import 'package:flutter/material.dart';
import 'package:ipotato_timer/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Potato Timer'),
          backgroundColor: AppColors.green,
        ),
        body: Container(
          child: Text("home"),
        ));
  }
}

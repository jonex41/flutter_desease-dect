import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_disease_dectection/gen/assets.gen.dart';
import 'package:flutter_disease_dectection/presentation/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      //  if (getBoolAsync('isFirstTime', defaultValue: true)) {
      //  setValue('isFirstTime', false);
      // appRoute.replaceAll([const MainBoardRoute()]);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
      // } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
            Center(child: Assets.images.desIcon.image(height: 200, width: 200)),
      ),
    );
  }
}

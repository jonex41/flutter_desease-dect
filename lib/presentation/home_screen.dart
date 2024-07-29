import 'package:flutter/material.dart';
import 'package:flutter_disease_dectection/gen/assets.gen.dart';
import 'package:flutter_disease_dectection/helper/button.dart';
import 'package:flutter_disease_dectection/presentation/maize_screen.dart';
import 'package:flutter_disease_dectection/presentation/potatoes_screen.dart';
import 'package:flutter_disease_dectection/presentation/tomato_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tflite_v2/tflite_v2.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void initTFlite() async {
      final res = await Tflite.loadModel(
          model: "assets/model.tflite",
          labels: "assets/labels.txt",
          numThreads: 1, // defaults to 1
          isAsset:
              true, // defaults to true, set to false to load resources outside assets
          useGpuDelegate:
              false // defaults to false, set to true to use GPU delegate
          );
    }

    useEffect(() {
      initTFlite();
      return null;
    });
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // red as border color
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.height,
                Assets.images.desIcon.image(height: 200, width: 200),
                20.height,

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // red as border color
                      ),
                    ),
                    child: const Text(
                      '''Welcome to PlantSage!
          
          PlantSage is a plant disease detection, classification, and recommendation system designed to keep your garden thriving. Simply upload a photo of your plant, and our app will quickly diagnose its health status and provide expert advice and tailored recommendations to ensure the best care.''',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
                20.height,
                const Text(
                  'Choose a plant to Diagnose ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                20.height,
                GenButton(
                    title: 'Maize',
                    color: Colors.green,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MaizeScreen()));
                    }),
                20.height,
                GenButton(
                    title: 'Potato',
                    color: Colors.green,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PotatoesScreen()));
                    }),
                20.height,
                GenButton(
                    title: 'Tomato',
                    color: Colors.green,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TomatoesScreen()));
                    }),
                //  40.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

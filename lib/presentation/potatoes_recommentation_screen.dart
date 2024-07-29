
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_disease_dectection/helper/button.dart';
import 'package:flutter_disease_dectection/presentation/maize_recommentation_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:nb_utils/nb_utils.dart';

class PotatoesRecommendationScreen extends HookWidget {
  const PotatoesRecommendationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final output = useState(getDisease(getStringAsync('diseaseName')));
  String value = getDiseaseRecommendation(getStringAsync('diseaseName'));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.file(
                      File(getStringAsync('path')),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                20.height,
                const Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                20.height,
                Text(
                  output.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
                20.height,
                // GenButton(title: 'Recommendation', onPress: () async {}),
                const Text(
                  'Recommendation',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
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
                    child: Text(
                    value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.lightBlue, fontSize: 16),
                    ),
                  ),
                ),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
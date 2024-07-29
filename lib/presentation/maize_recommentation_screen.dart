import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:nb_utils/nb_utils.dart';

class MaizeRecommendationScreen extends HookWidget {
  const MaizeRecommendationScreen({super.key});

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
                      style: const TextStyle(
                          color: Colors.lightBlue, fontSize: 16),
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

String getDiseaseRecommendation(String name) {
  if (name == 'Tomato___Late_blight') {
    return 'Enhance air circulation by spacing plants properly and treat preventively with fungicides like mefenoxam during cool, moist weather conditions.';
  } else if (name == 'Corn_(maize)___healthy') {
    return 'Maintain vigilance through regular crop inspections, and optimize growth conditions by managing soil nutrients and water levels effectively.';
  } else if (name == 'Tomato___Tomato_Yellow_Leaf_Curl_Virus') {
    return ' Manage whitefly populations rigorously using insecticides and remove infected plants immediately to reduce the risk of virus transmission.';
  } else if (name == 'Tomato___Tomato_mosaic_virus') {
    return 'Thoroughly disinfect garden tools and wash hands after handling infected plants, and promptly remove and destroy any plants showing symptoms.';
  } else if (name == 'Tomato___Target_Spot') {
    return ' Practice at least a three-year rotation with non-host crops and apply a targeted fungicidal program using products like copper hydroxide.';
  } else if (name == 'Tomato___Spider_mites Two-spotted_spider_mite') {
    return ' Apply appropriate miticides early upon detection and consider introducing predatory insects such as ladybugs to naturally control mite populations.';
  } else if (name == 'Tomato___Septoria_leaf_spot') {
    return 'Promptly remove diseased leaves, avoid working in wet conditions to reduce spread, and apply fungicides like pyraclostrobin to protect new foliage.';
  } else if (name == 'Tomato___Leaf_Mold') {
    return 'Increase between-plant spacing to improve air circulation and treat with targeted fungicides such as azoxystrobin when conditions are favorable for the disease.';
  } else if (name == 'Tomato___healthy') {
    return 'Conduct frequent inspections for pest and disease symptoms, provide a balanced fertilizer regime, and maintain optimal watering practices to promote healthy growth and resilience against diseases.';
  } else if (name == 'Tomato___Early_blight') {
    return 'Remove the first sign of infected lower leaves and apply a preventative fungicide spray schedule using products containing chlorothalonil or mancozeb.';
  } else if (name == 'Tomato___Bacterial_spot') {
    return 'Minimize leaf wetness by avoiding overhead irrigation and apply fixed copper bactericides to limit bacterial spread during warm, wet weather.';
  } else if (name == 'Potato___Late_blight') {
    return 'Implement a regimen of systemic fungicides such as chlorothalonil during wet conditions and destroy any infected plants to control disease spread.';
  } else if (name == 'Potato___healthy') {
    return 'Keep soil pH within the optimal range (5.5-6.5), ensure even moisture distribution, and plant only certified disease-free seed potatoes.';
  } else if (name == 'Potato___Early_blight') {
    return 'Use copper-based fungicides at early disease onset and ensure proper crop rotation with non-solanaceous crops to break the disease cycle.';
  } else if (name == 'Corn_(maize)___Northern_Leaf_Blight') {
    return 'Remove infected residues after harvest, practice crop rotation, and apply fungicides like propiconazole during humid conditions to prevent the disease.';
  } else if (name == 'Corn_(maize)___Common_rust') {
    return 'Employ rust-resistant varieties and apply protective fungicides, such as tebuconazole, early in the season to prevent rust spores from establishing.';
  } else if (name == 'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot') {
    return 'Apply a mixture of strobilurin and triazole-based fungicides promptly at the first signs of disease and ensure plants are well-spaced to enhance airflow and reduce moisture retention.';
  } else {
    return 'Image not within specified dataset';
  }
}

String getDisease(String name) {
  if (name == 'Tomato___Late_blight') {
    return 'Your tomato has late blight.';
  } else if (name == 'Corn_(maize)___healthy') {
    return ' Your corn is healthy.';
  } else if (name == 'Tomato___Tomato_Yellow_Leaf_Curl_Virus') {
    return 'Your tomato has yellow leaf curl virus.';
  } else if (name == 'Tomato___Tomato_mosaic_virus') {
    return 'Your tomato has mosaic virus.';
  } else if (name == 'Tomato___Target_Spot') {
    return 'Your tomato has target spot.';
  } else if (name == 'Tomato___Spider_mites Two-spotted_spider_mite') {
    return 'Your tomato has spider mites.';
  } else if (name == 'Tomato___Septoria_leaf_spot') {
    return 'Your tomato has septoria leaf spot.';
  } else if (name == 'Tomato___Leaf_Mold') {
    return ' Your tomato has leaf mold.';
  } else if (name == 'Tomato___healthy') {
    return 'Your tomato is healthy.';
  } else if (name == 'Tomato___Early_blight') {
    return 'Your tomato has early blight.';
  } else if (name == 'Tomato___Bacterial_spot') {
    return 'Your tomato has bacterial spot.';
  } else if (name == 'Potato___Late_blight') {
    return 'Your potato has late blight';
  } else if (name == 'Potato___healthy') {
    return 'Your potato is healthy.';
  } else if (name == 'Potato___Early_blight') {
    return 'Your potato has early blight';
  } else if (name == 'Corn_(maize)___Northern_Leaf_Blight') {
    return 'Your corn has northern leaf blight.';
  } else if (name == 'Corn_(maize)___Common_rust') {
    return 'Your corn has common rust';
  } else if (name == 'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot') {
    return 'Your corn has Cercospora leaf spot or gray leaf spot.';
  } else {
    return 'Error';
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_disease_dectection/gen/assets.gen.dart';
import 'package:flutter_disease_dectection/helper/button.dart';
import 'package:flutter_disease_dectection/presentation/potatoes_recommentation_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tflite_v2/tflite_v2.dart';

class PotatoesScreen extends HookWidget {
  const PotatoesScreen({super.key});

  Future<File?> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // final List<XFile>? files = im.files;
    if (image != null) {
      // photoReg(await File(image.path));
      return File(image.path);
    } else {
      return null;
      // _handleError(response.exception);
    }
  }

  Future<File?> getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    // final List<XFile>? files = im.files;
    if (image != null) {
      // photoReg(await File(image.path));
      return File(image.path);
    } else {
      return null;
      // _handleError(response.exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    final output = useState('');
    final path = useState('');

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.height,
              const Text(
                'Snap or upload\nPotato Leaf',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              20.height,
              GenButton(
                  title: 'Gallery',
                  color: Colors.green,
                  onPress: () async {
                    File? file = await getImage();
                    if (file != null) {
                      path.value = file.path;
                    }
                  }),
              20.height,
              GenButton(
                  title: 'Camera',
                  color: Colors.green,
                  onPress: () async {
                    File? file = await getImageCamera();
                    if (file != null) {
                      path.value = file.path;
                    }
                  }),
              20.height,
              if (path.value.trim().isNotEmpty)
                Image.file(
                  File(path.value),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              if (path.value.trim().isEmptyOrNull)
                Assets.images.pic.image(height: 200, width: 200),
              /*   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // red as border color
                    ),
                  ),
                  child: const Text(
                    'Picture that you snap\nor pick from Gallery',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                  ),
                ),
              ), */
              20.height,
              GenButton(
                  title: 'Detect',
                  color: Colors.green,
                  onPress: () async {
                    if (path.value.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please select an image First!')));
                      return;
                    }
                    File? file = File(path.value);
                    var recognitions = await Tflite.runModelOnImage(
                        path: file.path, // required
                        imageMean: 0.0, // defaults to 117.0
                        imageStd: 255.0, // defaults to 1.0
                        // numResults: 2,    // defaults to 5
                        threshold: 0.2, // defaults to 0.1
                        asynch: true // defaults to true
                        );

                    String name = '';
                    double parcent = 0;
                    for (var model in recognitions ?? []) {
                      if (model['confidence'] > parcent) {
                        name = model['label'];
                      }
                    }
                    var list1 = recognitions![0]['label'].toString().split(' ');
                    list1.removeAt(0);
                    String newName1 = list1.join(' ');
                    output.value = '$newName1 Detected';
                    if (recognitions[0]['confidence'] < 1) {
                      setValue('diseaseName', 'Error');
                    } else {
                      setValue('diseaseName', newName1);
                    }
                    setValue('path', path.value);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const PotatoesRecommendationScreen()));
                    /* if (recognitions.length == 2) {
                      var list =
                          recognitions[1]['label'].toString().split(' ');
                      list.removeAt(0);
                      String newName = list.join(' ');
                      '$output could also be a $newName disease';
                    }
                    if (recognitions.length == 3) {
                      var list2 =
                          recognitions[2]['label'].toString().split(' ');
                      list2.removeAt(0);
                      String newName2 = list2.join(' ');
                      '$output 0r ${newName2}disease';
                    } */
                    // setState(() {});
                  }),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}

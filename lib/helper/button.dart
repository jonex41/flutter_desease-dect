
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GenButton extends StatelessWidget {
  const GenButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.width,
      this.height,
      this.textcolor,
      this.color});
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textcolor;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width() - 150,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.black,
            shape: const StadiumBorder()),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textcolor ?? Colors.white),
        ),
      ),
    );
  }
}

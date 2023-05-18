import 'package:flutter/material.dart';
import 'package:my_image_editor/models/text_info.dart';

class MyImageText extends StatelessWidget {
  final TextInfo textInfo;
  const MyImageText({Key? key, required this.textInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo.text,
      textAlign: textInfo.textAlign,
      style: TextStyle(
        fontSize: textInfo.fontSize,
        fontWeight: textInfo.fontWeight,
        fontStyle: textInfo.fontStyle,
        color: textInfo.color,
      ),
    );
  }
}

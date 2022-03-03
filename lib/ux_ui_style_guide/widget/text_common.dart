import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextCommon extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;

  const TextCommon(this.text, {Key key, this.fontSize, this.fontFamily, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontSize: fontSize != null ? fontSize.sp : null,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color
      ),
    );
  }
}

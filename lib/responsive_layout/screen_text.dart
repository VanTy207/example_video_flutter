import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenText extends StatefulWidget {
  const ScreenText({Key key}) : super(key: key);

  @override
  _ScreenTextState createState() => _ScreenTextState();
}

class _ScreenTextState extends State<ScreenText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        children: [
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
            style: TextStyle(fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}

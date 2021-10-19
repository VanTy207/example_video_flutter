import 'package:example/sliver_appbar/sliver_appbar_custom_2/sample1.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_2/sample2.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_2/sample3.dart';
import 'package:flutter/material.dart';

class MainAppBarSliverAppBar extends StatelessWidget {
  onButtonTap(Widget page, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar & SliverAppBar"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: Text("Sample 1 - AppBar"),
              onTap: (){
                onButtonTap(Sample1(), context);
              },
            ),
            GestureDetector(
              child: Text("Sample 2 - SliverAppBar"),
              onTap: (){
                onButtonTap(Sample2(), context);
              },
            ),
            GestureDetector(
              child: Text("Sample 3 - SliverAppBar with Strech"),
              onTap: (){
                onButtonTap(Sample3(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
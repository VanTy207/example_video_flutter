import 'package:flutter/material.dart';
class AppBarAnimateCustom extends StatelessWidget {

  AnimationController colorAnimationController;
  Animation colorTween, homeTween, workOutTween, iconTween, drawerTween, transTween;
  Function onPressed;

  AppBarAnimateCustom({
    @required this.colorAnimationController,
    @required this.onPressed,
    @required this.colorTween,
    @required this.homeTween,
    @required this.iconTween,
    @required this.drawerTween,
    @required this.workOutTween,
    @required this.transTween,
  });

  @override
  Widget build(BuildContext context,) {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: onPressed,
          ),
          backgroundColor: colorTween.value,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              Text(
                "Hello  ",
                style: TextStyle(
                  color: homeTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7),
              child: Icon(
                Icons.notifications,
                color: iconTween.value,
              ),
            ),
            Transform.translate(
              offset: transTween.value,
              child: Text(
                "Test",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );

  }
}
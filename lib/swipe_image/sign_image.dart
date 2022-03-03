import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/swipe_image/gallery_photo_view_route.dart';
import 'package:example/swipe_image/hero.dart';
import 'package:flutter/material.dart';
class SignImage extends StatefulWidget {
  const SignImage({Key key}) : super(key: key);

  @override
  _SignImageRouteState createState() => _SignImageRouteState();
}

class _SignImageRouteState extends State<SignImage> {
  final  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> images = <String>[
    'https://photo.tuchong.com/14649482/f/601672690.jpg',
    'https://photo.tuchong.com/17325605/f/641585173.jpg',
    'https://photo.tuchong.com/3541468/f/256561232.jpg',
    'https://photo.tuchong.com/16709139/f/278778447.jpg',
    'https://photo.tuchong.com/5040418/f/43305517.jpg',
    'https://photo.tuchong.com/3019649/f/302699092.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title:  Text("Sign image"),
        ),
        body:
        Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => HeroIcon(url:  images[2],),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 250),
                  ),
                );
                // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) =>HeroIcon(url:  images[2],)));
              },
              child: Hero(
                tag: images[2],
                transitionOnUserGestures: true,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: CachedNetworkImage(
                      imageUrl:  images[2],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

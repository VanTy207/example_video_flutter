import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/swipe_image/gallery_photo_view_route.dart';
import 'package:example/swipe_image/hero.dart';
import 'package:example/util_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListImageRoute extends StatefulWidget {
  const ListImageRoute({Key key}) : super(key: key);

  @override
  _ListImageRouteState createState() => _ListImageRouteState();
}

class _ListImageRouteState extends State<ListImageRoute> {
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
        title:  Text("List image route"),
      ),
      body: ListView.builder(
        itemCount: images.length,
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(TransparentRoute(builder: (context) => GalleryPhotoViewRoute(index,urlImages: images, backgroundColor: Colors.black,)));
            },
            child: Hero(
              tag: images[index],
              transitionOnUserGestures: true,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

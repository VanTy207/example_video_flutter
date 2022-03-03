import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/swipe_image/hero_custom.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class HeroIcon extends StatefulWidget {
  final String url;
  const HeroIcon({Key key, this.url}) : super(key: key);

  @override
  _HeroIconState createState() => _HeroIconState();
}

class _HeroIconState extends State<HeroIcon> {
  final GlobalKey<ExtendedImageSlidePageState> slidePagekey = GlobalKey<ExtendedImageSlidePageState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ExtendedImageSlidePage(
        key: slidePagekey,
        slideAxis: SlideAxis.both,
        slideType: SlideType.onlyImage,
        child: HeroWidget(
          child: ExtendedImage.network(
            widget.url,
            enableSlideOutPage: true,
          ),
          tag: widget.url,
          slideType: SlideType.onlyImage,
          slidePagekey: slidePagekey,
        ),
      ),
    );
  }
}

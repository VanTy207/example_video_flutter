import 'package:auto_orientation/auto_orientation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/swipe_image/hero_custom.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:math';

class GalleryPhotoViewRoute extends StatefulWidget {
  final List<dynamic> urlImages;
  final int _index;
  final Color backgroundColor;

  const GalleryPhotoViewRoute(this._index, {Key key, this.urlImages, this.backgroundColor,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryPhotoViewState();
}

class _GalleryPhotoViewState extends State<GalleryPhotoViewRoute>  with SingleTickerProviderStateMixin {
  final  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RectTween _rectTween;
  int currentIndex;
  List<dynamic> _list = [];

  @override
  void initState() {
    AutoOrientation.fullAutoMode();
    currentIndex = widget._index ?? 0;
    if(widget.urlImages != null && widget.urlImages.length > 0){
      _list = List<dynamic>.from(widget.urlImages);
    }
    super.initState();
  }

  Color defaultSlidePageBackgroundHandler({Offset offset, Size pageSize, Color color, SlideAxis pageGestureAxis}) {
    double opacity = 0.0;
    if (pageGestureAxis == SlideAxis.both) {
      opacity = offset.distance / (Offset(pageSize.width, pageSize.height).distance / 2.0);
    } else if (pageGestureAxis == SlideAxis.horizontal) {
      opacity = offset.dx.abs() / (pageSize.width / 2.0);
    } else if (pageGestureAxis == SlideAxis.vertical) {
      opacity = offset.dy.abs() / (pageSize.height / 2.0);
    }
    print(min(1.0, max(1.0 - opacity, 0.0)));
    return color.withOpacity(min(1.0, max(1.0 - opacity, 0.0)));
  }

  bool defaultSlideEndHandler(
      {Offset offset, Size pageSize, SlideAxis pageGestureAxis}) {
    if (pageGestureAxis == SlideAxis.both) {
      return offset.distance >
          Offset(pageSize.width, pageSize.height).distance / 3.5;
    } else if (pageGestureAxis == SlideAxis.horizontal) {
      return offset.dx.abs() > pageSize.width / 3.5;
    } else if (pageGestureAxis == SlideAxis.vertical) {
      return offset.dy.abs() > pageSize.height / 3.5;
    }
    return true;
  }

  double defaultSlideScaleHandler(
      {Offset offset, Size pageSize, SlideAxis pageGestureAxis}) {
    double scale = 0.0;
    if (pageGestureAxis == SlideAxis.both) {
      scale = offset.distance / Offset(pageSize.width, pageSize.height).distance;
    } else if (pageGestureAxis == SlideAxis.horizontal) {
      scale = offset.dx.abs() / (pageSize.width / 2.0);
    } else if (pageGestureAxis == SlideAxis.vertical) {
      scale = offset.dy.abs() / (pageSize.height / 2.0);
    }
    return max(1.0 - scale, 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        leading:const SizedBox(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
        pageController: PageController(initialPage: widget._index ?? 0),
        scrollPhysics: const ClampingScrollPhysics(),
        backgroundDecoration: BoxDecoration(color: Colors.transparent),
        builder: (BuildContext context, int index) {
          final GlobalKey<ExtendedImageSlidePageState> slidePagekey = GlobalKey<ExtendedImageSlidePageState>();
          return PhotoViewGalleryPageOptions.customChild(
            // imageProvider: CachedNetworkImageProvider(_list[index]),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            child: Material(
              color: Colors.transparent,
              child: ExtendedImageSlidePage(
                key: slidePagekey,
                slideAxis: SlideAxis.both,
                slideType: SlideType.onlyImage,
                slidePageBackgroundHandler:(Offset offset, Size pageSize){
                  return defaultSlidePageBackgroundHandler(
                    offset: offset,
                    pageSize: pageSize,
                    color:Colors.black,
                    pageGestureAxis: SlideAxis.both
                  );
                },
                child: ExtendedImage.network(
                  _list[index],
                  enableSlideOutPage: true,
                ),
              ),
            ),
            heroAttributes: PhotoViewHeroAttributes(
              tag: _list[index],
              transitionOnUserGestures: true,
              createRectTween: (Rect begin, Rect end) {
              _rectTween = RectTween(begin: begin, end: end);
              print("_rectTween $_rectTween");
              return _rectTween;
              },
              flightShuttleBuilder: (BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext) {
                // make hero more smoothly
                final Hero hero = (flightDirection == HeroFlightDirection.pop ? fromHeroContext.widget : toHeroContext.widget) as Hero;
                if (_rectTween == null) {
                  print("_rectTween ");
                  return hero;
                }
                if (flightDirection == HeroFlightDirection.pop) {
                  final bool fixTransform = (slidePagekey.currentState?.offset != Offset.zero || slidePagekey.currentState.scale != 1.0);
                  final Widget toHeroWidget = (toHeroContext.widget as Hero).child;
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext buildContext, Widget child) {
                      Widget animatedBuilderChild = hero.child;
                      // make hero more smoothly
                      animatedBuilderChild = Stack(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        children: <Widget>[
                          Opacity(
                            opacity: 1 - animation.value,
                            child: SizedBox(
                              width: _rectTween.begin.width,
                              height: _rectTween.begin.height,
                              child: toHeroWidget,
                            ),
                          ),
                          Opacity(
                            opacity: animation.value,
                            child: animatedBuilderChild,
                          )
                        ],
                      );

                      // fix transform when slide out
                      if (fixTransform) {
                        final Tween<Offset> offsetTween = Tween<Offset>(begin: Offset.zero, end: slidePagekey.currentState.offset);
                        final Tween<double> scaleTween = Tween<double>(begin: 1.0, end:slidePagekey.currentState.scale);
                        animatedBuilderChild = Transform.translate(
                          offset: offsetTween.evaluate(animation),
                          child: Transform.scale(
                            scale: scaleTween.evaluate(animation),
                            child: animatedBuilderChild,
                          ),
                        );
                      }
                      return animatedBuilderChild;
                    },
                  );
                }
                return hero.child;
              },
            ),
          );
        },
        itemCount: _list.length,
        onPageChanged: (index) {
          currentIndex = index;
        },
        loadingBuilder: (context, event) => Center(child: CircularProgressIndicator(),),
      ),
    );
  }

  @override
  void dispose() {
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }
}

class PhotoViewRoute extends StatefulWidget {
  final String resourceUrl;
  final Color backgroundColor;

  PhotoViewRoute({this.resourceUrl, this.backgroundColor,});

  @override
  State<StatefulWidget> createState() => _PhotoViewRouteState();
}

class _PhotoViewRouteState extends State<PhotoViewRoute> {
  int currentIndex;
  final GlobalKey<ExtendedImageSlidePageState> slidePagekey = GlobalKey<ExtendedImageSlidePageState>();
  @override
  void initState() {
    super.initState();
    AutoOrientation.fullAutoMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
          child: PhotoViewGallery.builder(
              pageController: PageController(initialPage: 0),
              scrollPhysics: const BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(color: widget.backgroundColor),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                    imageProvider: CachedNetworkImageProvider(widget.resourceUrl),
                    heroAttributes: PhotoViewHeroAttributes(tag: index),
                    minScale: PhotoViewComputedScale.contained,
                    // child: ExtendedImageSlidePage(
                    //   key: slidePagekey,
                    //   slideAxis: SlideAxis.both,
                    //   slideType: SlideType.onlyImage,
                    //   child: HeroWidget(
                    //     child: ExtendedImage.network(
                    //       widget.resourceUrl,
                    //       enableSlideOutPage: true,
                    //     ),
                    //     tag: widget.resourceUrl,
                    //     slideType: SlideType.onlyImage,
                    //     slidePagekey: slidePagekey,
                    //   ),
                    // )
                );
              },
              itemCount: 1,
              onPageChanged: (index) {
                currentIndex = index;
              },
              loadingBuilder: (context, event) => Center(child: CircularProgressIndicator()))
      ),
    );
  }

  @override
  void dispose() {
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }
}
import 'dart:math';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


final stories = [
  StoryModel(title: 'STORY', imageUrl: "https://photo.tuchong.com/14649482/f/601672690.jpg"),
  StoryModel(title: 'STORY 1', imageUrl: 'https://photo.tuchong.com/17325605/f/641585173.jpg'),
  StoryModel(title: 'STORY 2', imageUrl: 'https://photo.tuchong.com/3541468/f/256561232.jpg'),
  StoryModel(title: 'STORY 3', imageUrl: 'https://photo.tuchong.com/16709139/f/278778447.jpg'),
  StoryModel(title: 'STORY 4', imageUrl: 'https://photo.tuchong.com/5040418/f/43305517.jpg'),
  StoryModel(title: 'STORY 5', imageUrl:  'https://photo.tuchong.com/3019649/f/302699092.jpg'),
];


class DismissiblePageRoute extends StatefulWidget {

  const DismissiblePageRoute({Key key,}) : super(key: key);

  @override
  _DismissiblePageRouteState createState() => _DismissiblePageRouteState();
}

class _DismissiblePageRouteState extends State<DismissiblePageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible page"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.vertical,
        itemBuilder: (_, int i) => StoryWidget(
          story: stories[i],
          position: i,
        ),
        separatorBuilder: (_, int i) => SizedBox(height: 10),
        itemCount: stories.length,
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  final int position;

  const StoryWidget({@required this.story, @required this.position});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransparentRoute(StoryPage(
          story: story,
          position: position,
        ));
      },
      child: Hero(
        tag: story.storyId,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            // height: 120,
            // width: 88,
            padding: const EdgeInsets.all(8),
            child: Text(
              story.title,
              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
            ),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(story.imageUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatelessWidget {
  final StoryModel story;
  final int position;

  const StoryPage({@required this.story, @required this.position});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: position);
    return DismissiblePage(
      onDismiss: () => Navigator.of(context).pop(),
      isFullScreen: false,
      dragSensitivity: .4,
      maxTransformValue: 4,
      direction: DismissDirection.vertical,
      child: Material(
          color: Colors.transparent,
          child: PhotoViewGallery.builder(
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            scrollPhysics: const ClampingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(stories[index].imageUrl),
                initialScale: PhotoViewComputedScale.contained,
                heroAttributes: PhotoViewHeroAttributes(tag: stories[index].storyId),
              );
            },
            itemCount: stories.length,
            loadingBuilder: (context, event) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                ),
              ),
            ),
            pageController: pageController,
          )
      ),
    );
  }
}

class StoryModel {
  final storyId = UniqueKey();
  final String title;
  String imageUrl;


  StoryModel({@required this.title, this.imageUrl});
}

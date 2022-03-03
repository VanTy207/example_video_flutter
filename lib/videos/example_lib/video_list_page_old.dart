import 'dart:math';
import 'package:example/videos/better_controller_custom.dart';
import 'package:example/videos/video_list_data.dart';
import 'package:flutter/material.dart';

import 'video_list_widget_old.dart';

class VideoListPageOld extends StatefulWidget {
  @override
  _VideoListPageOldState createState() => _VideoListPageOldState();
}

class _VideoListPageOldState extends State<VideoListPageOld> {
  final _random = new Random();
  final List<String> _videos = [
   "https://c-app.masterisehomes.com/media/24d8dd8cbd80dec3ffba89581414a996/2021/10/15/cae4f251-edea-43a9-9fba-b7af74af3579/1/playlist.m3u8",
    "https://c-app.masterisehomes.com/media/cb09788fd057541bb5b5ea5eecb16566/2021/10/12/96636313-ce68-4e0b-8f26-a5e469f1c72f/1/playlist.m3u8",
    "https://c-app.masterisehomes.com/media/711f5b9ea3a9a1c3fe25c8df5c56df81/2021/10/15/61d5033a-2a37-4e93-a484-ad0a0899ae16/1/playlist.m3u8",
    "https://c-app.masterisehomes.com/media/9d6919ac43cde5ab684fbb987022ecc5/2021/10/15/f6b77c70-24e4-49fb-ba17-41199e517c09/1/playlist.m3u8",
  ];
  List<VideoListData> dataList = [];
  var value = 0;
  BetterPlayerListVideoPlayerControllerCustom controller;

  @override
  void initState() {
    _setupData();
    controller = BetterPlayerListVideoPlayerControllerCustom();
    super.initState();
  }

  void _setupData() {
    for (int index = 0; index < 10; index++) {
      var randomVideoUrl = _videos[_random.nextInt(_videos.length)];
      dataList.add(VideoListData("Video $index", randomVideoUrl, thumbnail: "https://c-app.masterisehomes.com/media/2021/11/21/157df06f-65fe-490a-9de1-540667a20e2d/1/157df06f-65fe-490a-9de1-540667a20e2d.jpg"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video in list")),
      body: Container(
        color: Colors.white,
        child:ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            VideoListData videoListData = dataList[index];
            return VideoListWidgetOld(
              videoListData: videoListData,
              controller: controller,
              index: index,
            );
          },
        )
      ),
    );
  }
}

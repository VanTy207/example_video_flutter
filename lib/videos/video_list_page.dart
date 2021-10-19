import 'dart:math';
import 'package:example/videos/video_list_data.dart';
import 'package:flutter/material.dart';

import 'video_list_widget.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  final _random = new Random();
  final List<String> _videos = [
    "https://mtoczko.github.io/hls-test-streams/test-group/playlist.m3u8",
    "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
    "http://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8",
    "https://fps.ezdrm.com/demo/hls/BigBuckBunny_320x180.m3u8"
  ];
  List<VideoListData> dataList = [];
  var value = 0;

  @override
  void initState() {
    _setupData();
    super.initState();
  }

  void _setupData() {
    for (int index = 0; index < 10; index++) {
      var randomVideoUrl = _videos[_random.nextInt(_videos.length)];
      dataList.add(VideoListData("Video $index", randomVideoUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video in list")),
      body: Container(
        color: Colors.grey,
        child: Column(children: [
          TextButton(
            child: Text("Update page state"),
            onPressed: () {
              setState(() {
                value++;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                VideoListData videoListData = dataList[index];
                return VideoListWidget(
                  videoListData: videoListData,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

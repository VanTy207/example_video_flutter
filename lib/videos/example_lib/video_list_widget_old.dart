import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/videos/better_controller_custom.dart';
import 'package:example/videos/example_lib/better_player_list_video_player.dart';
import 'package:example/videos/video_list_data.dart';
import 'package:flutter/material.dart';

class VideoListWidgetOld extends StatefulWidget {
  final VideoListData videoListData;
  final BetterPlayerListVideoPlayerControllerCustom controller;
  final int index;
  const VideoListWidgetOld({Key key, this.videoListData, this.controller, this.index}) : super(key: key);

  @override
  _VideoListWidgetOldState createState() => _VideoListWidgetOldState();
}

class _VideoListWidgetOldState extends State<VideoListWidgetOld> {
  VideoListData get videoListData => widget.videoListData;
  ValueNotifier<double> _notifierIndex;

  @override
  void initState() {
    _notifierIndex = ValueNotifier(0.0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
              child: BetterPlayerListVideoPlayerCustomOld(
                BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  videoListData.videoUrl,
                  // notificationConfiguration: BetterPlayerNotificationConfiguration(
                  //   showNotification: true,
                  //   title: videoListData.videoTitle,
                  //   author: "Test",
                  // ),
                  bufferingConfiguration: BetterPlayerBufferingConfiguration(
                    minBufferMs: 2000,
                    maxBufferMs: 5000,
                    bufferForPlaybackMs: 1000,
                    bufferForPlaybackAfterRebufferMs: 2000,
                  ),
                ),
                configuration: BetterPlayerConfiguration(
                  autoPlay: false,
                  aspectRatio: 1,
                  placeholderOnTop: true,
                  showPlaceholderUntilPlay: true,
                  placeholder: CachedNetworkImage(
                    imageUrl: videoListData.thumbnail,
                    fit: BoxFit.fitWidth,
                  ),
                  playerVisibilityChangedBehavior: (double value){
                    print("visibleFraction 1 $value");
                  }
                ),
                //key: Key(videoListData.hashCode.toString()),
                playFraction: 0.8,
                notifierIndex: _notifierIndex,
                betterPlayerListVideoPlayerController: widget.controller,
              ),
              aspectRatio: 16/9,
          ),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _notifierIndex,
                builder: (context, value, _){
                  return Text("$value");
                }
            ),
          )
        ],
      ),
    );
  }
}

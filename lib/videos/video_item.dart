import 'package:better_player/better_player.dart';
import 'package:better_player/src/configuration/better_player_configuration.dart';
import 'package:better_player/src/configuration/better_player_data_source.dart';
import 'package:better_player/src/core/better_player_utils.dart';
import 'package:better_player/src/list/better_player_list_video_player_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/videos/better_controller_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BetterPlayerListVideoPlayerCustom extends StatefulWidget {
  final BetterPlayerDataSource dataSource;
  final double playFraction;
  final int index;
  final bool autoPlay;

  final bool autoPause;
  final Function(BetterPlayerController) onChangeCurrentPlayerController;


  const BetterPlayerListVideoPlayerCustom(
      this.dataSource, {
        this.playFraction = 0.6,
        this.autoPlay = true,
        this.autoPause = true,
        this.onChangeCurrentPlayerController,
        this.index,
        Key key,
      })  : assert(playFraction >= 0.0 && playFraction <= 1.0, ),
        super(key: key);

  @override
  _BetterPlayerListVideoPlayerCustomState createState() => _BetterPlayerListVideoPlayerCustomState();
}

class _BetterPlayerListVideoPlayerCustomState extends State<BetterPlayerListVideoPlayerCustom>{
  BetterPlayerController _betterPlayerController;
  bool _isDisposing = false;

  @override
  void initState() {
    print("initState");
    if(_betterPlayerController == null){
      _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          // autoPlay: widget.autoPlay,
          placeholderOnTop: true,
          allowedScreenSleep: false,
          showPlaceholderUntilPlay: true,
          autoDetectFullscreenDeviceOrientation: true,
          autoDetectFullscreenAspectRatio: true,
          // playerVisibilityChangedBehavior: onVisibilityChanged,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            showControls: true,
            enablePip: false,
            enableOverflowMenu: false,
            enableSkips: false,
            enableSubtitles: false,
          ),
          eventListener: (BetterPlayerEvent event) {
            if (event.betterPlayerEventType == BetterPlayerEventType.play) {
              /// Khi play video mới thì sẽ gọi callback cập nhật controller hiện tại tương ứng với controller mới này
              // _betterPlayerController.setControlsVisibility(true);
              widget.onChangeCurrentPlayerController.call(_betterPlayerController);
            }else if (event.betterPlayerEventType == BetterPlayerEventType.pause) {
              // _betterPlayerController.setControlsAlwaysVisible(true);
              // _betterPlayerController.setControlsVisibility(true);
            }else if (event.betterPlayerEventType == BetterPlayerEventType.hideFullscreen) {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown]
              );
            }
          },
        ),
        betterPlayerDataSource: widget.dataSource
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    _isDisposing = true;
    print("dispose");
    super.dispose();
  }

  void onVisibilityChanged(double visibleFraction) async {
    final bool isPlaying = _betterPlayerController.isPlaying();
    final bool initialized = _betterPlayerController.isVideoInitialized();
    // print("isPlaying -- ${widget.index} -- $isPlaying");
    // print("initialized -- ${widget.index} --  $initialized");
    print("visibleFraction play -- ${widget.index} --  $visibleFraction -- ${widget.playFraction}");
    if(visibleFraction == 0.0 && initialized && isPlaying && !_isDisposing){
      _betterPlayerController.pause();
    }
    // if (visibleFraction >= widget.playFraction) {
    //   print("visibleFraction play -- ${widget.index} --  $visibleFraction -- ${widget.playFraction}");
    //   // if (initialized && !isPlaying && !_isDisposing) {
    //   //
    //   //   // _betterPlayerController.play();
    //   // }
    // } else {
    //   print("visibleFraction pause  -- ${widget.index} --  $visibleFraction -- ${widget.playFraction}");
    //   // if (widget.autoPause && initialized && isPlaying && !_isDisposing) {
    //   //   print("visibleFraction 4");
    //   //   _betterPlayerController.pause();
    //   // }
    // }
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return AspectRatio(
      aspectRatio: _betterPlayerController.getAspectRatio() ?? BetterPlayerUtils.calculateAspectRatio(context),
      child:  BetterPlayer(
        key: Key("${_getUniqueKey()}_player"),
        controller: _betterPlayerController,
      ),
    );
  }

  String _getUniqueKey() => widget.dataSource.hashCode.toString();

  @override
  bool get wantKeepAlive => true;
}

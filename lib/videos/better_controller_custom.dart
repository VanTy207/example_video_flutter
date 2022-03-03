import 'package:better_player/better_player.dart';

///Controller of Better Player List Video Player.
class BetterPlayerListVideoPlayerControllerCustom {
  BetterPlayerController _betterPlayerController;
  // final List<BetterPlayerController> _betterPlayerControllerRegistry = [];

  void setVolume(double volume) {
    _betterPlayerController?.setVolume(volume);
  }

  void pause() {
    _betterPlayerController?.pause();
  }

  void play() {
    _betterPlayerController?.play();
  }

  void seekTo(Duration duration) {
    _betterPlayerController?.seekTo(duration);
  }

  // ignore: use_setters_to_change_properties
  void setBetterPlayerController(BetterPlayerController betterPlayerController) {
    if(_betterPlayerController != null && _betterPlayerController != betterPlayerController){
      if(_betterPlayerController.isPlaying()){
        _betterPlayerController.setControlsAlwaysVisible(true);
        _betterPlayerController?.pause();
      }
    }
    _betterPlayerController = betterPlayerController;
    if(betterPlayerController.isPlaying()){
      Future.delayed(Duration(milliseconds: 3000), (){
        _betterPlayerController.setControlsVisibility(false);
      });
    }
  }

  void setMixWithOthers(bool mixWithOthers) {
    _betterPlayerController?.setMixWithOthers(mixWithOthers);
  }
}
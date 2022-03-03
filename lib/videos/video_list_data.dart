class VideoListData {
  final String videoTitle;
  final String videoUrl;
  final String thumbnail;
  Duration lastPosition;
  bool wasPlaying = false;

  VideoListData(this.videoTitle, this.videoUrl,{this.thumbnail});
}

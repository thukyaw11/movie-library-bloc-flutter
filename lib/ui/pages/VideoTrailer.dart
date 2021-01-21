import 'package:flutter/material.dart';
import 'package:movie_app/network/models/videos_model/videos_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoTrailer extends StatefulWidget {
  final List<VideoModel> youtubeKeys;
  VideoTrailer({this.youtubeKeys});
  @override
  _VideoTrailerState createState() => _VideoTrailerState(youtubeKeys);
}

class _VideoTrailerState extends State<VideoTrailer> {
  final List<VideoModel> kkKey;
  _VideoTrailerState(this.kkKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Trailer"),
      ),
      body: Center(
        child: Container(
          child: Stack(children: [
            Positioned(
              top: 70,
              left: MediaQuery.of(context).size.width / 2,
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
              ),
            ),
            YoutubePlayerIFrame(
              controller: YoutubePlayerController(
                initialVideoId: kkKey[0].key,
                params: YoutubePlayerParams(
                  startAt: Duration(seconds: 0),
                  showControls: true,
                  showFullscreenButton: false,
                ),
              ),
              aspectRatio: 16 / 9,
            ),
          ]),
        ),
      ),
    );
  }
}

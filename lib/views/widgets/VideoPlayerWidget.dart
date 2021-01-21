import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget({Key key, @required this.url})
      : super(key: key);


  @override
_VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}
class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool isShowPlaying = false;
  bool noMore=false;
  CachedVideoPlayerController controller;
  @override
  void initState() {

    controller= CachedVideoPlayerController.network(widget.url);
    controller.setLooping(true);
    controller.initialize().then((_) {
      setState(() {});
      controller.play();
    });
    print(widget.url);
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(

                children: <Widget>[
                  IconButton(
                    icon: new Icon( Icons.arrow_back,size: 30.0,color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      body: controller.value != null && controller.value.initialized
          ? Center(
            child: AspectRatio(
        child: CachedVideoPlayer(controller),
        aspectRatio: controller.value.aspectRatio,
      ),
          )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


}


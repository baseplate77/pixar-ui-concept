import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constant.dart';
import '../widgets/movie_ticket.dart';

class MovieCheckout extends StatelessWidget {
  const MovieCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color2,
      body: Stack(
        children: [
          Positioned(
            top: -60,
            child: Container(
              width: deviceData.width,
              height: 400,
              child: VideoP(),
            ),
          ),
          Container(
            width: deviceData.width,
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    noColor,
                    color2.withOpacity(0.6),
                    color2.withOpacity(1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.6, 1],
                  tileMode: TileMode.clamp),
            ),
          ),

          Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ))),
          // TweenAnimationBuilder<double?>(
          //   tween: Tween<double?>(begin: 1, end: 0),
          //   duration: Duration(milliseconds: 2000),
          //   builder: (context, double? value, child) {
          //     return Opacity(
          //       opacity: value!,
          //       child: child,
          //     );
          //   },
          //   child: Container(
          //     width: deviceData.width,
          //     color: color2,
          //     height: 250,
          //   ),
          // ),
          TweenAnimationBuilder(
            tween: Tween<Offset>(
                begin: Offset(deviceData.width * 0.1, 1500),
                end: Offset(deviceData.width * 0.1, deviceData.height * 0.22)),
            duration: Duration(milliseconds: 1000),
            builder: (context, Offset value, child) {
              return Transform.translate(
                offset: value,
                child: child,
              );
            },
            child:
                SizedBox(width: deviceData.width * 0.8, child: MovieTicket()),
          ),
        ],
      ),
    );
  }
}

class VideoP extends StatefulWidget {
  const VideoP({Key? key}) : super(key: key);

  @override
  _VideoPState createState() => _VideoPState();
}

class _VideoPState extends State<VideoP> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/forzondemo.mp4")
      ..addListener(() {
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
            height: 300,
            color: color2,
            child: buildVideo(),
          )
        : Container(
            color: color2,
          );
  }

  Widget buildVideo() {
    return AspectRatio(aspectRatio: 21 / 9, child: VideoPlayer(_controller));
  }
}

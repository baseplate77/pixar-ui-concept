import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:palette_generator/palette_generator.dart';

import '../constant.dart';
import '../data.dart';
import 'custom_pageView.dart';

class ScorblePageView extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final BoxConstraints constraints;
  final Function(int) pageChange;

  ScorblePageView(
      {required this.backgroundColor,
      required this.constraints,
      required this.pageChange});

// update to change max and min height is scrollable pageView
  @override
  double get maxExtent => constraints.maxHeight * 0.72;

  @override
  double get minExtent => constraints.maxHeight * 0.48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double viewportFraction =
        max(0.45, 0.8 - (shrinkOffset / constraints.maxHeight));

    // print("viewPort : $viewportFraction");
    return Stack(
      children: [
        CPageView(
          viewportFraction: viewportFraction,
          pageChange: pageChange,
        ),
        SizedBox(
          height: constraints.maxHeight * 0.15,
          child: ListView(
            padding: EdgeInsets.only(
              top: 60,
              left: 18,
              right: 18,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              Text(
                "Popular Now",
                style: kText24.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30 * viewportFraction + 16),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                "Noitfication",
                style: kText24.copyWith(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 28 * viewportFraction + 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CPageView extends StatefulWidget {
  const CPageView({
    Key? key,
    required this.viewportFraction,
    required this.pageChange,
  }) : super(key: key);

  final double viewportFraction;
  final Function(int) pageChange;

  @override
  _CPageViewState createState() => _CPageViewState();
}

class _CPageViewState extends State<CPageView> {
  late PageController _controller;
  double? pageOffset = 0;
  // List<PaletteGenerator?> colors=[];
  List<Color> colors = [
    Color(0xff57557b),
    Color(0xff7b878b),
    Color(0xffa6aa51),
    Color(0xff894c8b),
    Color(0xff7a95ae)
  ];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // _updatePalette();
    _controller = PageController(viewportFraction: widget.viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = _controller.page;
          // print("page offset ${_controller.page}");
        });
      });
  }

  // Future<void> _updatePalette() async {
  //   for (String image in imagePaths) {
  //     final PaletteGenerator paletteGenerator =
  //         await PaletteGenerator.fromImageProvider(
  //       AssetImage(image),
  //       size: Size(200, 200),
  //       // region: Rect.fromLTRB(10, 20, 100, 50),
  //       // maximumColorCount: 5,
  //     );
  //     // colors.add(paletteGenerator.mutedColor);
  //     print("color add : ${paletteGenerator.mutedColor} ");
  //   }
  //   print("done ");
  //   // setState(() {});
  // }

  Future<bool> rebuild(void Function() cb) async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance!.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance!.endOfFrame;
      if (!mounted) return false;
    }

    setState(cb);
    return true;
  }

  @override
  void didUpdateWidget(covariant CPageView oldWidget) {
    _controller = PageController(viewportFraction: widget.viewportFraction)
      ..addListener(() {
        rebuild(() {
          pageOffset = _controller.page;
        });
      });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // top app bar padding
      padding: EdgeInsets.only(top: 40),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              colors[_currentPage],
              mainColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 200.0, end: 0),
        duration: const Duration(milliseconds: 1750),
        curve: Curves.fastOutSlowIn,
        builder: (BuildContext context, double? value, Widget? child) {
          return Transform.translate(
            offset: Offset(value!, 0),
            child: CustomPageView.builder(
                restorationId: "1",
                controller: _controller,
                physics: AlwaysScrollableScrollPhysics(),
                onPageChanged: (value) {
                  widget.pageChange(value);
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: moviesDetails.length,
                viewportDirection: false,
                itemBuilder: (context, idx) {
                  double scale = max(
                      widget.viewportFraction,
                      (1 - (pageOffset! - idx).abs()) +
                          widget.viewportFraction);
                  double opacity =
                      min(1, (1 - (pageOffset! - idx).abs()) + 0.5);
                  return Opacity(
                    opacity: max(0.4, opacity), 
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.only(
                        top: 130 - (scale * 30),
                        bottom: 10,
                        left: 20,
                      ),
                      child: ClipRRect(
                        borderRadius: kBorderRadius,
                        child: Image.asset(
                          moviesDetails[idx].images,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
// TweenAnimationBuilder(
//       tween: Tween<double>(begin: 200.0, end: 0),
//       duration: const Duration(milliseconds: 750),
//       curve: Curves.fastOutSlowIn,
//       builder: (BuildContext context, double? value, Widget? child) {
//         ;
//       },
//     )



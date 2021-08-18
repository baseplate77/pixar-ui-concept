import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_ui/constant.dart';
import 'package:movie_app_ui/main.dart';
import 'package:movie_app_ui/screens/movie_checkout.dart';
import 'package:movie_app_ui/util/scale_transition.dart';
import 'dart:math' as math;

class MovieStudio extends StatelessWidget {
  const MovieStudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceData = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                secondaryColor.withOpacity(0.5),
                mainColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.55],
              tileMode: TileMode.clamp),
          color: secondaryColor.withOpacity(0.7),
          borderRadius: kBorderRadius),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Studio #1",
            style: kText16.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _timeingContainer(
                    text: "09:00 AM",
                    isBorder: false,
                    bgColor: color2,
                    textColor: Colors.grey.shade300,
                  ),
                  _timeingContainer(
                    text: "11:00 AM",
                    isBorder: true,
                    bgColor: noColor,
                    textColor: Colors.white,
                  ),
                  _timeingContainer(
                    text: "01:30 PM",
                    isBorder: true,
                    bgColor: noColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _timeingContainer(
                    text: "04:00 PM",
                    isBorder: false,
                    bgColor: color2,
                    textColor: Colors.white,
                  ),
                  _timeingContainer(
                    text: "07:00 AM",
                    isBorder: true,
                    bgColor: noColor,
                    textColor: Colors.white,
                  ),
                  _timeingContainer(
                    text: "09:30 PM",
                    isBorder: false,
                    bgColor: color2,
                    textColor: Colors.grey.shade300,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 36,
          ),
          // MoviewScreen(deviceData: deviceData),
          SeatBuilder(),
          SizedBox(
            height: 26,
          ),
          ComfirmButton(),
        ],
      ),
    );
  }

  Widget _timeingContainer(
      {required bool isBorder,
      required Color bgColor,
      required String text,
      required Color textColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        border: isBorder
            ? Border.all(width: 0.5, color: Colors.grey.shade300)
            : null,
        boxShadow: !isBorder ? [shadow] : [],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: kText16.copyWith(color: textColor),
      ),
    );
  }
}

class MoviewScreen extends StatelessWidget {
  const MoviewScreen({Key? key, required this.deviceData}) : super(key: key);
  final Size deviceData;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(deviceData.width * 0.9, 100),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()..strokeWidth = 10;
    // canvas.drawLine(Offset(0, 0), Offset(300, 100), linePaint);
    Paint arPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = color2;
    Rect rect = Rect.fromLTWH(size.width * 0.12, 20, 250, 80);
    canvas.drawArc(rect, math.pi, math.pi, false, arPaint);
    // canvas.drawColor(color2, BlendMode.clear);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SeatBuilder extends StatelessWidget {
  const SeatBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
          ],
        ),
        Column(
          children: [
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(),
          ],
        ),
        Column(
          children: [
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(),
            _movieSeat(avaliable: false),
          ],
        ),
        Column(
          children: [
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(avaliable: false),
          ],
        ),
        Column(
          children: [
            _movieSeat(),
            _movieSeat(avaliable: false),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(avaliable: false),
          ],
        ),
        Column(
          children: [
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
            _movieSeat(avaliable: false),
          ],
        ),
        Column(
          children: [
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
            _movieSeat(),
          ],
        ),
      ],
    );
  }

  Widget _movieSeat({bool avaliable = true}) {
    String imagePath =
        avaliable ? "assets/images/seat.svg" : "assets/images/no_seat.svg";
    bool isSelected = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return GestureDetector(
          onTap: () {
            if (!imagePath.contains("no_seat")) {
              if (imagePath.contains("selected_seat")) {
                setState(() {
                  imagePath = "assets/images/seat.svg";
                  isSelected = true;
                });
              } else {
                setState(() {
                  isSelected = true;
                  imagePath = "assets/images/selected_seat.svg";
                });
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: secondaryColor.withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 0), // Shadow position
                      )
                    ]
                  : [],
            ),
            child: SvgPicture.asset(
              imagePath,
              width: 35,
              height: 35,
            ),
          ),
        );
      },
    );
  }
}

class ComfirmButton extends StatefulWidget {
  const ComfirmButton({Key? key}) : super(key: key);

  @override
  _ComfirmButtonState createState() => _ComfirmButtonState();
}

class _ComfirmButtonState extends State<ComfirmButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _opacitycontroller;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _opacitycontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _widthAnimation = Tween<double>(begin: 280, end: 60).animate(_controller)
      ..addListener(() {
        if (_controller.isAnimating) {
          Future.delayed(Duration(milliseconds: 200), () {
            _opacitycontroller.forward();
          });
        }
      });
    _opacityAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(_opacitycontroller)
          ..addListener(() {
            if (_opacitycontroller.isCompleted) {
              Navigator.push(context, ScaleRoute(page: MovieCheckout()));
            
            }
          });
    super.initState();
  }

  double _width = 280;
  bool _hideText = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          _controller.forward();
          setState(() {
            _hideText = true;
          });
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              alignment: Alignment.center,
              height: 60,
              width: _widthAnimation.value,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius:
                      BorderRadius.circular(300 - _widthAnimation.value),
                  boxShadow: [shadow]),
              child: _hideText
                  ? Opacity(
                      opacity: _opacityAnimation.value,
                      child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    )
                  : Text(
                      "Confirm Booking",
                      style: kText18,
                    ),
            );
          },
        ),
      ),
    );
  }
}

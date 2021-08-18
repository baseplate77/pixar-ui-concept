import 'package:flutter/material.dart';

import '../constant.dart';
import '../data.dart';

class MovieDates extends StatefulWidget {
  const MovieDates({Key? key}) : super(key: key);

  @override
  _MovieDatesState createState() => _MovieDatesState();
}

class _MovieDatesState extends State<MovieDates>
    with SingleTickerProviderStateMixin {
  double _scale = 1;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int selectedDateIdx = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: showDates.length,
        itemBuilder: (context, index) {
          double _scale = 1;
          Color? color;
          if (index == selectedDateIdx) {
            _scale = 1 - _controller.value;
            color = color2;
          }

          return Transform.scale(
            scale: _scale,
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                setState(() {
                  selectedDateIdx = index;
                });
                _tapDown();
              },
              onTapUp: (TapUpDetails details) {
                _tapUp();
              },
              child: Container(
                width: 110,
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: kBorderRadius,
                    border: selectedDateIdx != index
                        ? Border.all(width: 1, color: Colors.grey.shade300)
                        : null,
                    boxShadow: selectedDateIdx == index ? [shadow] : []),
                child: Column(
                  children: [
                    Text(
                      showDates[index].weekDay,
                      style: kText20.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300),
                    ),
                    Text(
                      showDates[index].date,
                      style: kText20.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapDown() {
    _controller.forward();
  }

  void _tapUp() {
    _controller.reverse();
  }
}

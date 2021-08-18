import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/constant.dart';
import 'package:scratcher/scratcher.dart';

final double kRadius = 12;

class MovieTicket extends StatelessWidget {
  const MovieTicket({Key? key}) : super(key: key);
  final double lWidth = 130.0;
  final double gap = 36;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kRadius),
                  topRight: Radius.circular(kRadius)),
              color: color4,
            ),
            child: Text(
              "Frozen II - Original Motion Picture",
              style:
                  kText24.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(kRadius),
                bottomRight: Radius.circular(kRadius)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _fields(label: "Date", value: "17.08.21"),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      width: lWidth,
                      child: _fields(label: "Seat", value: "D6,D7")),
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _fields(label: "Time", value: "11.00 PM"),
                  SizedBox(
                      width: lWidth,
                      child: _fields(label: "Price", value: "₹350")),
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _fields(label: "Cinima", value: "AMC NP 11"),
                  SizedBox(
                      width: lWidth,
                      child: _fields(label: "Order id", value: "115632")),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              MySeparator(
                color: color2,
              ),
              SizedBox(
                height: 16,
              ),
              ScatchCode(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _fields({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kText20.copyWith(
              color: Colors.grey.shade500, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Text(value,
            style: kText24.copyWith(
                color: Color(0xFF6E606D), fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class ScatchCode extends StatefulWidget {
  const ScatchCode({Key? key}) : super(key: key);

  @override
  _ScatchCodeState createState() => _ScatchCodeState();
}

class _ScatchCodeState extends State<ScatchCode> {
  
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(kRadius),
      child: Scratcher(
        brushSize: 30,
        threshold: 60,
        // color: Colors.red,
        image: Image.asset("assets/images/barcode_cover.png"),
        // onChange: (value) => print("Scratch progress: $value%"),
        // onThreshold: () => print("Threshold reached, you won!"),
        child: SizedBox(
            width: deviceData.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("assets/images/barcode.svg"),
            )),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 2, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 8.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

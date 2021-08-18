import 'package:flutter/material.dart';
import 'package:movie_app_ui/constant.dart';
import 'package:movie_app_ui/data.dart';
import 'package:movie_app_ui/widgets/movieStudio.dart';
import 'package:movie_app_ui/widgets/movie_date.dart';

import 'widgets/Scrollable_pageview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currrentMovie = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: LayoutBuilder(
        builder: (context, contraints) => CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: ScorblePageView(
                  backgroundColor: Colors.orange,
                  pageChange: (value) {
                    print("page change to : $value");
                    setState(() {
                      currrentMovie = value;
                    });
                  },
                  constraints: contraints,
                )),
            SliverPadding(
              padding: EdgeInsets.only(left: 20, right: 18),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MovieInfo(currrentMovie: currrentMovie),
                    DetailNShowTime(currrentMovie: currrentMovie),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieInfo extends StatelessWidget {
  const MovieInfo({Key? key, required this.currrentMovie}) : super(key: key);
  final int currrentMovie;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(-150, 0), end: Offset(0, 0)),
      duration: Duration(milliseconds: 800),
      builder: (context, Offset value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: Colors.grey.shade300)),
                child: Text(
                  "IMDb",
                  style: kText16.copyWith(color: Colors.grey.shade300),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                moviesDetails[currrentMovie].imdb.toString(),
                style: kText16.copyWith(
                    color: Colors.grey.shade300, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            moviesDetails[currrentMovie].title,
            style: kText24.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            moviesDetails[currrentMovie].summary.substring(0, 50) + '...',
            style: kText16.copyWith(),
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}

class DetailNShowTime extends StatefulWidget {
  const DetailNShowTime({
    Key? key,
    required this.currrentMovie,
  }) : super(key: key);
  final currrentMovie;
  @override
  _DetailNShowTimeState createState() => _DetailNShowTimeState();
}

class _DetailNShowTimeState extends State<DetailNShowTime> {
  late PageController _pageController;
  final borderRadius = BorderRadius.circular(12);

  final shadows = [
    BoxShadow(
      color: secondaryColor.withOpacity(0.45),
      blurRadius: 40,
      spreadRadius: 10,
      offset: Offset(0, 15), // Shadow position
    )
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceData = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: deviceData.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: () {
                    if (selectedIndex != 0)
                      setState(() {
                        selectedIndex = 0;
                        _pageController.jumpToPage(selectedIndex);
                      });
                  },
                  child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0 ? secondaryColor : null,
                        borderRadius: borderRadius,
                        boxShadow: selectedIndex == 0 ? shadows : [],
                      ),
                      child: Text(
                        "Details",
                        style: kText22.copyWith(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == 0
                                ? Colors.white
                                : Colors.grey.shade400),
                      )),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: () {
                    if (selectedIndex != 1)
                      setState(() {
                        selectedIndex = 1;
                        _pageController.jumpToPage(selectedIndex);
                      });
                  },
                  child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1 ? secondaryColor : null,
                        borderRadius: borderRadius,
                        boxShadow: selectedIndex == 1 ? shadows : [],
                      ),
                      child: Text(
                        "Showtimes",
                        style: kText22.copyWith(
                            color: selectedIndex == 1
                                ? Colors.white
                                : Colors.grey.shade400,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 850,
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            children: [
              MovieDetail(currrentMovie: widget.currrentMovie),
              ShowTime(),
            ],
          ),
        )
        // Image.asset("assets/images/elsa.webp")
      ],
    );
  }
}

class ShowTime extends StatelessWidget {
  const ShowTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "Choose Date",
          style: kText24.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        MovieDates(),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "AMC NewPark 12",
              style:
                  kText24.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: kBorderRadius, color: secondaryColor),
              child: Text(
                "10min",
                style: kText14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        Text(
          "989 lifestyle St Malence, Califonia 19289",
          style: kText14.copyWith(
              fontSize: 12,
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        MovieStudio()
      ],
    );
  }
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key? key,
    required this.currrentMovie,
  }) : super(key: key);

  final int currrentMovie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Story",
          style: kText24.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          moviesDetails[currrentMovie].story.substring(0, 1000) + "...",
          style: kText16.copyWith(
              fontWeight: FontWeight.w500, color: Colors.grey.shade300),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Charaters",
          style: kText24.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: moviesDetails[0]
                .charater
                .map((c) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: kBorderRadius,
                          child: Image.asset(
                            c.imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 12, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.charaterName,
                                style: kText22.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                c.name,
                                style: kText20.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

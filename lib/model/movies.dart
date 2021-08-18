class Movie {
  double imdb;
  String title;
  String summary;
  String story;
  String images;
  List<Charater> charater;
  Movie({
    required this.imdb,
    required this.title,
    required this.summary,
    required this.story,
    required this.images,
    required this.charater,
  });
}

class Charater {
  String imagePath;
  String charaterName;
  String name;
  Charater({
    required this.imagePath,
    required this.charaterName,
    required this.name,
  });
}

class ShowDate {
  String weekDay;
  String date;
  ShowDate({
    required this.weekDay,
    required this.date,
  });
}

import 'package:movie_app_ui/model/movies.dart';

List<String> imagePaths = [
  "assets/images/frozon-2.jpeg",
  "assets/images/luca.jpg",
  "assets/images/toy_story.jpg",
  "assets/images/onward.jpg",
  "assets/images/good-dinosour.jpg",
];

List<ShowDate> showDates = [
  ShowDate(weekDay: "Friday", date: "2 Dec"),
  ShowDate(weekDay: "Saturday", date: "3 Dec"),
  ShowDate(weekDay: "Sunday", date: "4 Dec"),
  ShowDate(weekDay: "Monday", date: "5 Dec"),
  ShowDate(weekDay: "Tueday", date: "6 Dec"),
];

List<Charater> charaters = [
  Charater(
      imagePath: "assets/images/elsa.webp",
      charaterName: 'Elsa',
      name: 'Idina Menzel'),
  Charater(
      imagePath: "assets/images/anna.webp",
      charaterName: 'Anna',
      name: 'Kristen Bell'),
  Charater(
      imagePath: "assets/images/olaf.webp",
      charaterName: 'Olaf',
      name: 'Josh Gad'),
  Charater(
      imagePath: "assets/images/kristoff.webp",
      charaterName: 'Kristoff',
      name: 'Jonathan Groff'),
  Charater(
      imagePath: "assets/images/sven.webp",
      charaterName: 'Sven',
      name: 'Jonathan Groff'),
  Charater(
      imagePath: "assets/images/hans.webp",
      charaterName: 'Hans',
      name: 'Santino Fontana'),
  Charater(
      imagePath: "assets/images/duke.webp",
      charaterName: 'Duke',
      name: 'Alan Tudyk'),
  Charater(
      imagePath: "assets/images/oaken.webp",
      charaterName: 'Oaken',
      name: 'Chris Williams'),
  Charater(
      imagePath: "assets/images/marshmallow.webp",
      charaterName: 'Marshmallow',
      name: 'Paul Briggs'),
];

List<Movie> moviesDetails = [
  Movie(
    imdb: 8.8,
    title: "Frozen II",
    summary:
        "Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.",
    story:
        "The film opens with young Anna (voice of Hadley Gannaway) and Elsa (voice of Mattea Conforti) playing a game with Elsa's snow creations in an enchanted forest of their own creation. King Agnarr (voice of Alfred Molina) and Queen Iduna (voice of Evan Rachel Wood) enter, and Agnarr tells the girls he has seen an enchanted forest in real life.\n In his youth, he joined his father, King Runeard (voice of Jeremy Sisto), and other Arendellian soldiers to venture into the Enchanted Forest, where they came to know the four spirits of the forest - Earth, Fire, Water, and Air. Suddenly, the forest's inhabitants, the Northuldra, started attacking the Arendellians, and Agnarr lost his father before losing consciousness. He recalls being saved by a mysterious being. After he finishes his story, Iduna sings a lullaby to the girls ('All Is Found').\nIn the present day, Elsa (now voiced by Idina Menzel) hears a melodic voice calling out to her, but nobody else can hear the sound. Anna (now voiced by Kristen Bell) joins Olaf (voice of Josh Gad) outside as he contemplates the changes around him. Anna isn't bothered by changes because she has all the people she loves ('Some Things Never Change'). Meanwhile, Kristoff (voice of Jonathan Groff) tells Sven that he is planning on proposing to Anna.\nLater that night, the gang plays charades together, but Elsa hears the voice calling out to her again. Distressed, she leaves the room. Kristoff tries to find a good time to propose to Anna, but she is more concerned with how Elsa is acting. After assuring her sister she is going to be fine, they go to bed.\nThe voice continues to call Elsa through the night, leading her to leave her room and wonder what it is that is calling her, and how she wants to learn more about it ('Into The Unknown'). The magic around her shows her images of mysterious creatures. Suddenly, Arendelle begins to experience strange occurrences. A strong wind blows into the kingdom, the water from the fountains drain out, the fire from the lanterns go out, and the earth begins to tremble fiercely. Elsa helps lead the citizens to higher ground.\nThe gang meets with Grand Pabbie (voice of Ciaran Hinds) and the other Trolls. He tells the sisters that the spirits of the Enchanted Forest are angered over a wrongdoing that must be corrected, or else Arendelle's future will be in jeopardy. Elsa decides she must set off on her own to fix it, but Anna refuses to let her go alone. Naturally, Kristoff, Sven, and Olaf join as well.",
    images: "assets/images/frozon-2.jpeg",
    charater: charaters,
  ),
  Movie(
    imdb: 7.5,
    title: "Luca",
    summary:
        "Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.",
    story:
        "The film opens with young Anna (voice of Hadley Gannaway) and Elsa (voice of Mattea Conforti) playing a game with Elsa's snow creations in an enchanted forest of their own creation. King Agnarr (voice of Alfred Molina) and Queen Iduna (voice of Evan Rachel Wood) enter, and Agnarr tells the girls he has seen an enchanted forest in real life. In his youth, he joined his father, King Runeard (voice of Jeremy Sisto), and other Arendellian soldiers to venture into the Enchanted Forest, where they came to know the four spirits of the forest - Earth, Fire, Water, and Air. Suddenly, the forest's inhabitants, the Northuldra, started attacking the Arendellians, and Agnarr lost his father before losing consciousness. He recalls being saved by a mysterious being. After he finishes his story, Iduna sings a lullaby to the girls ('All Is Found').\nIn the present day, Elsa (now voiced by Idina Menzel) hears a melodic voice calling out to her, but nobody else can hear the sound. Anna (now voiced by Kristen Bell) joins Olaf (voice of Josh Gad) outside as he contemplates the changes around him. Anna isn't bothered by changes because she has all the people she loves ('Some Things Never Change'). Meanwhile, Kristoff (voice of Jonathan Groff) tells Sven that he is planning on proposing to Anna.\nLater that night, the gang plays charades together, but Elsa hears the voice calling out to her again. Distressed, she leaves the room. Kristoff tries to find a good time to propose to Anna, but she is more concerned with how Elsa is acting. After assuring her sister she is going to be fine, they go to bed.\nThe voice continues to call Elsa through the night, leading her to leave her room and wonder what it is that is calling her, and how she wants to learn more about it ('Into The Unknown'). The magic around her shows her images of mysterious creatures. Suddenly, Arendelle begins to experience strange occurrences. A strong wind blows into the kingdom, the water from the fountains drain out, the fire from the lanterns go out, and the earth begins to tremble fiercely. Elsa helps lead the citizens to higher ground.\nThe gang meets with Grand Pabbie (voice of Ciaran Hinds) and the other Trolls. He tells the sisters that the spirits of the Enchanted Forest are angered over a wrongdoing that must be corrected, or else Arendelle's future will be in jeopardy. Elsa decides she must set off on her own to fix it, but Anna refuses to let her go alone. Naturally, Kristoff, Sven, and Olaf join as well.",
    images: "assets/images/luca.jpg",
    charater: charaters,
  ),
  Movie(
    imdb: 6.8,
    title: "Toy story 4",
    summary:
        "Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.",
    story:
        "The film opens with young Anna (voice of Hadley Gannaway) and Elsa (voice of Mattea Conforti) playing a game with Elsa's snow creations in an enchanted forest of their own creation. King Agnarr (voice of Alfred Molina) and Queen Iduna (voice of Evan Rachel Wood) enter, and Agnarr tells the girls he has seen an enchanted forest in real life. In his youth, he joined his father, King Runeard (voice of Jeremy Sisto), and other Arendellian soldiers to venture into the Enchanted Forest, where they came to know the four spirits of the forest - Earth, Fire, Water, and Air. Suddenly, the forest's inhabitants, the Northuldra, started attacking the Arendellians, and Agnarr lost his father before losing consciousness. He recalls being saved by a mysterious being. After he finishes his story, Iduna sings a lullaby to the girls ('All Is Found').\nIn the present day, Elsa (now voiced by Idina Menzel) hears a melodic voice calling out to her, but nobody else can hear the sound. Anna (now voiced by Kristen Bell) joins Olaf (voice of Josh Gad) outside as he contemplates the changes around him. Anna isn't bothered by changes because she has all the people she loves ('Some Things Never Change'). Meanwhile, Kristoff (voice of Jonathan Groff) tells Sven that he is planning on proposing to Anna.\nLater that night, the gang plays charades together, but Elsa hears the voice calling out to her again. Distressed, she leaves the room. Kristoff tries to find a good time to propose to Anna, but she is more concerned with how Elsa is acting. After assuring her sister she is going to be fine, they go to bed.\nThe voice continues to call Elsa through the night, leading her to leave her room and wonder what it is that is calling her, and how she wants to learn more about it ('Into The Unknown'). The magic around her shows her images of mysterious creatures. Suddenly, Arendelle begins to experience strange occurrences. A strong wind blows into the kingdom, the water from the fountains drain out, the fire from the lanterns go out, and the earth begins to tremble fiercely. Elsa helps lead the citizens to higher ground.\nThe gang meets with Grand Pabbie (voice of Ciaran Hinds) and the other Trolls. He tells the sisters that the spirits of the Enchanted Forest are angered over a wrongdoing that must be corrected, or else Arendelle's future will be in jeopardy. Elsa decides she must set off on her own to fix it, but Anna refuses to let her go alone. Naturally, Kristoff, Sven, and Olaf join as well.",
    images: "assets/images/toy_story.jpg",
    charater: charaters,
  ),
  Movie(
    imdb: 8.0,
    title: "Onward",
    summary:
        "Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.",
    story:
        "The film opens with young Anna (voice of Hadley Gannaway) and Elsa (voice of Mattea Conforti) playing a game with Elsa's snow creations in an enchanted forest of their own creation. King Agnarr (voice of Alfred Molina) and Queen Iduna (voice of Evan Rachel Wood) enter, and Agnarr tells the girls he has seen an enchanted forest in real life. In his youth, he joined his father, King Runeard (voice of Jeremy Sisto), and other Arendellian soldiers to venture into the Enchanted Forest, where they came to know the four spirits of the forest - Earth, Fire, Water, and Air. Suddenly, the forest's inhabitants, the Northuldra, started attacking the Arendellians, and Agnarr lost his father before losing consciousness. He recalls being saved by a mysterious being. After he finishes his story, Iduna sings a lullaby to the girls ('All Is Found').\nIn the present day, Elsa (now voiced by Idina Menzel) hears a melodic voice calling out to her, but nobody else can hear the sound. Anna (now voiced by Kristen Bell) joins Olaf (voice of Josh Gad) outside as he contemplates the changes around him. Anna isn't bothered by changes because she has all the people she loves ('Some Things Never Change'). Meanwhile, Kristoff (voice of Jonathan Groff) tells Sven that he is planning on proposing to Anna.\nLater that night, the gang plays charades together, but Elsa hears the voice calling out to her again. Distressed, she leaves the room. Kristoff tries to find a good time to propose to Anna, but she is more concerned with how Elsa is acting. After assuring her sister she is going to be fine, they go to bed.\nThe voice continues to call Elsa through the night, leading her to leave her room and wonder what it is that is calling her, and how she wants to learn more about it ('Into The Unknown'). The magic around her shows her images of mysterious creatures. Suddenly, Arendelle begins to experience strange occurrences. A strong wind blows into the kingdom, the water from the fountains drain out, the fire from the lanterns go out, and the earth begins to tremble fiercely. Elsa helps lead the citizens to higher ground.\nThe gang meets with Grand Pabbie (voice of Ciaran Hinds) and the other Trolls. He tells the sisters that the spirits of the Enchanted Forest are angered over a wrongdoing that must be corrected, or else Arendelle's future will be in jeopardy. Elsa decides she must set off on her own to fix it, but Anna refuses to let her go alone. Naturally, Kristoff, Sven, and Olaf join as well.",
    images: "assets/images/onward.jpg",
    charater: charaters,
  ),
  Movie(
    imdb: 8.8,
    title: "The good dinosaur",
    summary:
        "Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.",
    story:
        "The film opens with young Anna (voice of Hadley Gannaway) and Elsa (voice of Mattea Conforti) playing a game with Elsa's snow creations in an enchanted forest of their own creation. King Agnarr (voice of Alfred Molina) and Queen Iduna (voice of Evan Rachel Wood) enter, and Agnarr tells the girls he has seen an enchanted forest in real life. In his youth, he joined his father, King Runeard (voice of Jeremy Sisto), and other Arendellian soldiers to venture into the Enchanted Forest, where they came to know the four spirits of the forest - Earth, Fire, Water, and Air. Suddenly, the forest's inhabitants, the Northuldra, started attacking the Arendellians, and Agnarr lost his father before losing consciousness. He recalls being saved by a mysterious being. After he finishes his story, Iduna sings a lullaby to the girls ('All Is Found').\nIn the present day, Elsa (now voiced by Idina Menzel) hears a melodic voice calling out to her, but nobody else can hear the sound. Anna (now voiced by Kristen Bell) joins Olaf (voice of Josh Gad) outside as he contemplates the changes around him. Anna isn't bothered by changes because she has all the people she loves ('Some Things Never Change'). Meanwhile, Kristoff (voice of Jonathan Groff) tells Sven that he is planning on proposing to Anna.\nLater that night, the gang plays charades together, but Elsa hears the voice calling out to her again. Distressed, she leaves the room. Kristoff tries to find a good time to propose to Anna, but she is more concerned with how Elsa is acting. After assuring her sister she is going to be fine, they go to bed.\nThe voice continues to call Elsa through the night, leading her to leave her room and wonder what it is that is calling her, and how she wants to learn more about it ('Into The Unknown'). The magic around her shows her images of mysterious creatures. Suddenly, Arendelle begins to experience strange occurrences. A strong wind blows into the kingdom, the water from the fountains drain out, the fire from the lanterns go out, and the earth begins to tremble fiercely. Elsa helps lead the citizens to higher ground.\nThe gang meets with Grand Pabbie (voice of Ciaran Hinds) and the other Trolls. He tells the sisters that the spirits of the Enchanted Forest are angered over a wrongdoing that must be corrected, or else Arendelle's future will be in jeopardy. Elsa decides she must set off on her own to fix it, but Anna refuses to let her go alone. Naturally, Kristoff, Sven, and Olaf join as well.",
    images: "assets/images/good-dinosour.jpg",
    charater: charaters,
  ),
];

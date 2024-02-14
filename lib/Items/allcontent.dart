class AllContent {
  String image;
  String title;
  String discription;

  AllContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}

List<AllContent> contents = [
  AllContent(
    title: 'Your News',
    image: "background4.jpg",
    discription: 'Stay Informed,Anytime,Anywhere \n your News,Your Way. ',
  ),
  AllContent(
    title: 'Welcome',
    image: "newspaper1.jpg",
    discription: 'Elevate your Awareness-where Every Update Sparks Knowledge.',
  ),
];

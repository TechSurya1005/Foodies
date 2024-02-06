class NewsModal {
  final String image;
  final String date;
  final String title;
  final String desc;

  NewsModal({
    required this.image,
    required this.date,
    required this.title,
    required this.desc,
  });
}

List<NewsModal> newsblogData = [
  NewsModal(
      image: "assets/images/news1.png",
      date: "28, Sep, 2023",
      title: "Burger",
      desc: "Greek yogurt breakfast bowls with toppings."),
  NewsModal(
      image: "assets/images/news2.png",
      date: "29, Sep, 2023",
      title: "Pizza",
      desc: "Greek yogurt breakfast bowls with toppings."),
  NewsModal(
      image: "assets/images/news3.png",
      date: "30, Sep, 2023",
      title: "Maggie",
      desc: "Greek yogurt breakfast bowls with toppings."),
];

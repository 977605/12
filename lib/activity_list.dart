
class ActivityList {
  String name;
  String image;
  String gif;
  int id;

  ActivityList({
    required this.name,
    required this.image,
    required this.gif,
    required this.id,
  });
}

List<ActivityList> ativityList = [
  ActivityList(
    id: 1,
    name: 'Читать книгу',
    image: 'assets/images/book.jpg',
    gif: 'assets/images/reeding_books.gif',
  ),
  ActivityList(
    id: 2,
    name: 'Пора чистить зубы',
    image: 'assets/images/brush_teeth.jpg',
    gif: 'assets/images/frog.gif',
  ),
  ActivityList(
    id: 3,
    name: 'Уберем игрушки вместе',
    image: 'assets/images/toy.jpg',
    gif: 'assets/images/fold_toys.gif',
  ),
  ActivityList(
    id: 4,
    name: 'Вкусно поесть',
    image: 'assets/images/eatbutton.png',
    gif: 'assets/images/eating.gif',
  ),
  ActivityList(
    id: 5,
    name: 'Давай сделаем зарядку',
    image: 'assets/images/gymbutton.png',
    gif: 'assets/images/excercise.gif',
  ),
];
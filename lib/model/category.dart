class Category{
  dynamic id ;
  String title;
  String image;
  Category({required this.id,required this.title,required this.image});

  static List<Category> getCategory(){
    return [
      Category(id: 28, title: 'Action', image: 'assets/images/action.jpg'),
      Category(id: 12, title: 'Adventure', image: 'assets/images/Adventure.jpg'),
      Category(id: 80, title: 'Crime', image: 'assets/images/Crime.jpg'),
      Category(id: 14, title: 'Fantasy', image: 'assets/images/Fantasy.jpg'),
      Category(id: 18, title: 'Drama', image: 'assets/images/Drama.jpg'),
      Category(id: 36, title: 'History', image: 'assets/images/History.jpg'),
      Category(id: 35, title: 'Comedy', image: 'assets/images/Comedy.jpg'),
      Category(id: 16, title: 'Animation', image: 'assets/images/Animation.jpg'),
      Category(id: 99, title: 'Documentary', image: 'assets/images/Documentary.jpg'),
      Category(id: 10751, title: 'Family', image: 'assets/images/Family.jpg'),
    ];
  }







}
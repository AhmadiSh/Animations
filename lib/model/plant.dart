class Plant {
  final int id;
  final String title;
  final String price;
  final int? offer;
   final bool liked;
  final List<String> state;
  final String image;


  Plant(
      {required this.id,
      required this.title,
      required this.price,
        this.offer,
      required this.liked,
      required this.state,
      required this.image});


}

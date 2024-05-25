class CardItem {
  final String name;
  final String description;
  final String location;
  final double rating;
  final double price;
  final double duration;
  final List<String> imageUrls;

  CardItem({
    required this.name,
    required this.description,
    required this.location,
    required this.rating,
    required this.price,
    required this.duration,
    required this.imageUrls,
  });
}

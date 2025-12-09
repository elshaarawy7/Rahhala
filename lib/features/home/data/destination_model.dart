class Destination {
  final String id;
  final String cityName;
  final String countryName;
  final String imageUrl;
  final String description;

  Destination({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.imageUrl,
    required this.description,
  });

  factory Destination.create({
    required String id,
    required String cityName,
    required String countryName,
    required String imageUrl,
    required String description,
  }) {
    return Destination(
      id: id,
      cityName: cityName,
      countryName: countryName,
      imageUrl: imageUrl,
      description: description,
    );
  }
}

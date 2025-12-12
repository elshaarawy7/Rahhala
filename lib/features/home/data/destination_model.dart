class Destination {
  final String id;
  final String cityName;
  final String countryName;
  final String imageUrl;
  final String description;

  // Flight Information
  final double ticketPrice;
  final String currency;
  final String departureTime;
  final String arrivalTime;
  final String flightDuration;
  final String airline;
  final String flightNumber;
  final String departureAirport;
  final String arrivalAirport;

  Destination({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.imageUrl,
    required this.description,
    required this.ticketPrice,
    required this.currency,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDuration,
    required this.airline,
    required this.flightNumber,
    required this.departureAirport,
    required this.arrivalAirport,
  });

  factory Destination.create({
    required String id,
    required String cityName,
    required String countryName,
    required String imageUrl,
    required String description,
    required double ticketPrice,
    required String currency,
    required String departureTime,
    required String arrivalTime,
    required String flightDuration,
    required String airline,
    required String flightNumber,
    required String departureAirport,
    required String arrivalAirport,
  }) {
    return Destination(
      id: id,
      cityName: cityName,
      countryName: countryName,
      imageUrl: imageUrl,
      description: description,
      ticketPrice: ticketPrice,
      currency: currency,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      flightDuration: flightDuration,
      airline: airline,
      flightNumber: flightNumber,
      departureAirport: departureAirport,
      arrivalAirport: arrivalAirport,
    );
  }
}

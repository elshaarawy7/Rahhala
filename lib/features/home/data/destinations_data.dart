import 'destination_model.dart';

class DestinationsData {
  static final List<Destination> popularDestinations = [
    Destination.create(
      id: '1',
      cityName: 'Paris',
      countryName: 'France',
      imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
      description: 'City of Light',
    ),
    Destination.create(
      id: '2',
      cityName: 'Dubai',
      countryName: 'UAE',
      imageUrl: 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
      description: 'Modern Marvel',
    ),
    Destination.create(
      id: '3',
      cityName: 'Tokyo',
      countryName: 'Japan',
      imageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf',
      description: 'Land of Rising Sun',
    ),
    Destination.create(
      id: '4',
      cityName: 'New York',
      countryName: 'USA',
      imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9',
      description: 'The Big Apple',
    ),
    Destination.create(
      id: '5',
      cityName: 'London',
      countryName: 'UK',
      imageUrl: 'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad',
      description: 'Historic Capital',
    ),
    Destination.create(
      id: '6',
      cityName: 'Barcelona',
      countryName: 'Spain',
      imageUrl: 'https://images.unsplash.com/photo-1583422409516-2895a77efded',
      description: 'Mediterranean Gem',
    ),
    Destination.create(
      id: '7',
      cityName: 'Istanbul',
      countryName: 'Turkey',
      imageUrl: 'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200',
      description: 'Bridge of Cultures',
    ),
    Destination.create(
      id: '8',
      cityName: 'Singapore',
      countryName: 'Singapore',
      imageUrl: 'https://images.unsplash.com/photo-1525625293386-3f8f99389edd',
      description: 'Garden City',
    ),
  ];
}

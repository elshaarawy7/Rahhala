import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/home/widgets/booking_button.dart';
import 'package:user_inter_face_2/features/home/widgets/destination_header.dart';
import 'package:user_inter_face_2/features/home/widgets/flight_info_card.dart';
import 'package:user_inter_face_2/features/home/widgets/flight_timeline.dart';
import 'package:user_inter_face_2/features/home/widgets/hero_image_section.dart';
import 'package:user_inter_face_2/features/home/widgets/price_card.dart';

class HomeDetiles extends StatelessWidget {
  final Destination destination;

  const HomeDetiles({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Image Section
                HeroImageSection(imageUrl: destination.imageUrl),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Destination Header
                      DestinationHeader(
                        cityName: destination.cityName,
                        countryName: destination.countryName,
                        description: destination.description,
                      ),

                      const Gap(24),

                      // Price Card
                      PriceCard(
                        ticketPrice: destination.ticketPrice,
                        currency: destination.currency,
                      ),

                      const Gap(24),

                      // Flight Information
                      FlightInfoCard(
                        airline: destination.airline,
                        flightNumber: destination.flightNumber,
                        flightDuration: destination.flightDuration,
                      ),

                      const Gap(24),

                      // Flight Timeline
                      FlightTimeline(
                        departureAirport: destination.departureAirport,
                        departureTime: destination.departureTime,
                        arrivalAirport: destination.arrivalAirport,
                        arrivalTime: destination.arrivalTime,
                        flightDuration: destination.flightDuration,
                      ),

                      const Gap(100), // Space for booking button
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),

          // Booking Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingButton(destination: destination),
          ),
        ],
      ),
    );
  }
}

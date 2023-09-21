import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const LocationMapScreen({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Location on Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: {
          Marker(
            markerId: const MarkerId("selected_location"),
            position: LatLng(latitude, longitude),
          ),
        },
      ),
    );
  }
}

// lib/screens/cinema_map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemaMapScreen extends StatefulWidget {
  @override
  _CinemaMapScreenState createState() => _CinemaMapScreenState();
}

class _CinemaMapScreenState extends State<CinemaMapScreen> {
  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('cinema1'),
      position: LatLng(-6.200000, 106.816666),
      infoWindow: InfoWindow(title: 'Cinema 1'),
    ),
    Marker(
      markerId: MarkerId('cinema2'),
      position: LatLng(-6.917464, 107.619123),
      infoWindow: InfoWindow(title: 'Cinema 2'),
    ),
    // Add more markers for other cinema locations
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Locations'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.200000, 106.816666),
          zoom: 10,
        ),
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(46.8188, -92.0843);
  final LatLng _favPlaceA =
      const LatLng(46.823917, -92.101261); // Favorite Place A
  final LatLng _favPlaceB =
      const LatLng(46.781087, -92.091733); // Favorite Place B
  final LatLng _favPlaceC =
      const LatLng(46.778847, -92.099990); // Favorite Place C

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stanley\'s Maps Sample App'),
          backgroundColor: Color.fromARGB(255, 0, 164, 170),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: {
            Marker(
                markerId: MarkerId('Favorite Place A'),
                position: _favPlaceA,
                infoWindow: InfoWindow(title: 'Stanley\'s Home')),
            Marker(
                markerId: MarkerId('Favorite Place B'),
                position: _favPlaceB,
                infoWindow: InfoWindow(title: 'Lake Walk')),
            Marker(
                markerId: MarkerId('Favorite Place C'),
                position: _favPlaceC,
                infoWindow: InfoWindow(title: 'Great Lakes Aquarium')),
          },
        ),
      ),
    );
  }
}

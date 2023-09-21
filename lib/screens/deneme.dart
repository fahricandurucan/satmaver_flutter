import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:satmaver_flutter/screens/location_map_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  late String lat;
  late String long;

  Future<Position> getCurrentlyLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("location services are disables");
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Locaiton permisson are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("erwkfmweklfmwlef");
    }

    return await Geolocator.getCurrentPosition();
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((positon) {
      lat = positon.latitude.toString();
      long = positon.longitude.toString();

      setState(() {
        print("lat = $lat    -    long = $long");
      });
    });
  }

  Future<void> openMap(String lat, String long) async {
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$long";

    if (!await launchUrlString(googleUrl)) {
      throw Exception('Could not launch $googleUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deneme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  getCurrentlyLocation().then((value) {
                    lat = "${value.latitude}";
                    long = "${value.longitude}";
                    setState(() {
                      print("lat = $lat    -    long = $long");
                    });
                    liveLocation();
                  });
                },
                child: const Text("Get current location")),
            ElevatedButton(
                onPressed: () {
                  openMap(lat, long);
                },
                child: const Text("open google maps")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationMapScreen(
                      latitude: double.parse(lat),
                      longitude: double.parse(long),
                    ),
                  ),
                );
              },
              child: const Text("Show on Map"),
            ),
          ],
        ),
      ),
    );
  }
}

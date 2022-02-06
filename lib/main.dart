import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

const title = 'geolocation Demo';

void main() => runApp(
      MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var havePermission = false;
  Position? position;

  @override
  void initState() {
    super.initState();
    _getPermission().then((p) {
      setState(() => havePermission = p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Get Location'),
              onPressed: havePermission ? _getPosition : null,
            ),
            _buildReport(),
          ],
        ),
      ),
    );
  }

  Widget _buildReport() {
    if (position == null) return Text('position is unknown');
    return Column(
      children: [
        Text('latitude: ${position!.latitude}'),
        Text('longitude: ${position!.longitude}'),
      ],
    );
  }

  Future<bool> _getPermission() async {
    // Test if location services are enabled.
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;
    // Consider asking user to enable location services.

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    return permission != LocationPermission.deniedForever;
  }

  void _getPosition() async {
    var p = await Geolocator.getCurrentPosition();
    setState(() => position = p);
  }
}

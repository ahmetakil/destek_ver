import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();

  final LatLng _initialLocation;
  final bool selectMode;

  MapScreen(this._initialLocation,[this.selectMode = false]);
}

class _MapScreenState extends State<MapScreen> {

  LatLng _pickedLocation;

  @override
  void initState() {
    _pickedLocation = widget._initialLocation;
    super.initState();
  }

  void pickLocation(LatLng newLocation){
    setState(() {
      _pickedLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Haritadan Seç"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _pickedLocation == null ? null :() {
              Navigator.of(context).pop(_pickedLocation);
            },
          )
        ],
      ),
    body: GoogleMap(
      onTap: widget.selectMode ? pickLocation : null,
      markers: {
        Marker(
          markerId: MarkerId("A"),
          position: _pickedLocation,
        ),
      },
      initialCameraPosition: CameraPosition(
        target: widget._initialLocation,
        zoom: 16,
      ),
    ),
    );
  }
}

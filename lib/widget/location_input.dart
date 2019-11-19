import 'package:DestekVer/provider/location_provider.dart';
import 'package:DestekVer/screens/map_screen.dart';
import 'package:DestekVer/util/location_util.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationInput extends StatefulWidget {
  static String address;
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _imgPreviewUrl;
  LatLng _location;

  void loadInitialLoc() async {
    _location = await LocationUtil.getCurrentLocation();
    _imgPreviewUrl = await LocationUtil.generateLocImage(_location);
  }

  @override
  void initState() {
    loadInitialLoc();
    super.initState();
  }

  void loadImageUrl() async {
    this._location = await LocationUtil.getCurrentLocation();

    String url = await LocationUtil.generateLocImage(_location);
    setState(() {
      _imgPreviewUrl = url;
    });
    Provider.of<LocationProvider>(context, listen: false).location = _location;
  }

  Future<void> selectOnMap() async {
    final locData = await LocationUtil.getCurrentLocation();
    _location = LatLng(locData.latitude, locData.longitude);
    final LatLng selected = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => MapScreen(_location, true),
      ),
    );
    _location = selected != null ? selected : _location;
    final url = await LocationUtil.generateLocImage(_location);
    setState(() {
      _imgPreviewUrl = url;
    });
    Provider.of<LocationProvider>(context, listen: false).location = _location;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              alignment: Alignment.center,
              child: _imgPreviewUrl == null
                  ? Text(
                      "Konum Seç",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                      textAlign: TextAlign.center,
                    )
                  : ClipRRect(
                      child: Image.network(
                        _imgPreviewUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
                onPressed: loadImageUrl,
                icon: Icon(Icons.location_on),
                label: Text(
                  "Mevcut Konumum",
                  style: TextStyle(fontSize: 12),
                )),
            FlatButton.icon(
                onPressed: selectOnMap,
                icon: Icon(Icons.map),
                label: Text(
                  "Haritadan Seç",
                  style: TextStyle(fontSize: 12),
                )),
          ],
        )
      ],
    );
  }
}

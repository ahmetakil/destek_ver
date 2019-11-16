import 'package:demo_app1/util/location_util.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _imgPreviewUrl;

  void loadImageUrl() async {
    String url = await LocationUtil.generateLocImage();
    setState(() {
      _imgPreviewUrl = url;
    });
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
            )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
                onPressed: loadImageUrl,
                icon: Icon(Icons.location_on),
                label: Text("Mevcut Konumum")),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text("Haritadan Seç")),
          ],
        )
      ],
    );
  }
}

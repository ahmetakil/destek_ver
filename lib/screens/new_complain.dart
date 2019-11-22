import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/provider/location_provider.dart';
import 'package:DestekVer/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../widget/media_input.dart';

class NewComplain extends StatefulWidget {
  static const routeName = '/newComplain';

  @override
  _NewComplainState createState() => _NewComplainState();
}

class _NewComplainState extends State<NewComplain> {

  final _complainTopicController = TextEditingController();
  final _complainController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Image selected;

  void _submitData() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final locationProvider = Provider.of<LocationProvider>(context,listen: false);
    LatLng loc = locationProvider.location;

    if (loc == null) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Lütfen konum belirtin"),
      ));
      return;
    }

    Provider.of<ComplainsProvider>(context, listen: false).addNewComplain(
      username: 'Ahmet Akıl',
      complainTopic: _complainTopicController.text,
      complain: _complainController.text,
      location: loc,
      date: DateTime.now(),
    );
    locationProvider.location = null;
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Container(
        transform: Matrix4.translationValues(0, 10, 0),
        child: RaisedButton(
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.send,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Gönder",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onPressed: _submitData,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Lütfen Konuyu Belirtin";
                        } else if (value.length < 3) {
                          return "Konu en az 4 karakter olmalıdır";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Konu',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: _complainTopicController,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Lütfen Şikayetinizi Girin";
                        } else if (value.length < 5) {
                          return "Şikayetiniz en az 6 karakter olmalıdır";
                        }
                        return null;
                      },
                      maxLength: 200,
                      decoration: InputDecoration(
                        labelText: 'Şikayet',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: _complainController,
                      maxLines: 5,
                    ),
                    SizedBox(height: 20),
                    LocationInput(),
                    MediaInput(selected),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

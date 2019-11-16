import 'package:demo_app1/provider/complains_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewComplain extends StatefulWidget {
  static const routeName = '/newComplain';

  @override
  _NewComplainState createState() => _NewComplainState();
}

class _NewComplainState extends State<NewComplain> {
  final _nameController = TextEditingController();
  final _complainController = TextEditingController();
  final _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitData() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    Provider.of<ComplainsProvider>(context, listen: false).addNewComplain(
        _nameController.text,
        _complainController.text,
        _locationController.text,
        DateTime.now(),
        0);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şikayet Ekle'),
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
                          return "Lütfen Isminizi Girin";
                        } else if (value.length < 3) {
                          return "Isminiz en az 4 karakter olmalıdır";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Ad-Soyad',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: _nameController,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Lütfen Şikayetinizi Girin";
                        } else if (value.length < 5) {
                          return "Şikayetiniz en az 6 karakter olmalıdır";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Şikayet',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: _complainController,
                      maxLines: 5,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Konum',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: _locationController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: RaisedButton(
              child: Text(
                'Şikayet Ekle',
                style: TextStyle(fontSize: 22),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            ),
          )
        ],
      ),
    );
  }
}
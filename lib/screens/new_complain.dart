import 'package:flutter/material.dart';

class NewComplain extends StatefulWidget {
  static const routeName = '/newComplain';

  @override
  _NewComplainState createState() => _NewComplainState();
}

class _NewComplainState extends State<NewComplain> {
  final _nameController = TextEditingController();
  final _complainController = TextEditingController();
  final _locationController = TextEditingController();

  void _submitData() {
    final Function addComp = ModalRoute.of(context).settings.arguments;

    if (_nameController.text.isEmpty ||
        _complainController.text.isEmpty ||
        _locationController.text.isEmpty) {
      return;
    }
    addComp(
      _nameController.text,
      _complainController.text,
      _locationController.text,
      DateTime.now(),
      0,
      0,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şikayet Ekle'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Ad-Soyad',
              ),
              controller: _nameController,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Şikayet',
              ),
              controller: _complainController,
              maxLines: 5,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Konum',
              ),
              controller: _locationController,
            ),
            RaisedButton(
              child: Text('Şikayet ekle'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}

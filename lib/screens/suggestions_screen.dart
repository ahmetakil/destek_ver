import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionsScreen extends StatelessWidget {
  final _complainTopicController = TextEditingController();
  final _complainController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitData(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        return "Lütfen önerinizi girin";
                      } else if (value.length < 5) {
                        return "Öneriniz en az 6 karakter olmalıdır";
                      }
                      return null;
                    },
                    maxLength: 200,
                    decoration: InputDecoration(
                      labelText: 'Öneri',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    controller: _complainController,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitData(context);
                    },
                    color: Colors.green,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            'Gönder',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

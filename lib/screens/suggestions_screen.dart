import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionsScreen extends StatefulWidget {
  static const routeName = '/SuggestionScreen';

  @override
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final _complainTopicController = TextEditingController();

  final _complainController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final snackbar = SnackBar(
    content: Text('Öneriniz belediyenize iletildi'),
  );

  void _submitData(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Scaffold.of(context).showSnackBar(snackbar);
    setState(() {
      _formKey.currentState.reset();
    });
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
                        return "Lütfen Önerinizin Konusunu Belirtin";
                      } else if (value.length < 3) {
                        return "Konu en az 4 karakter olmalıdır";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Önerinin Konusu',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    controller: _complainTopicController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Lütfen önerinizi girin";
                      } else if (value.length < 5) {
                        return "Öneriniz en az 6 karakter olmalıdır";
                      }
                      return null;
                    },
                    maxLength: 280,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      _submitData(context);
                    },
                    color: Colors.green,
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            'Gönder',
                            style: TextStyle(
                              fontSize: 20,
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

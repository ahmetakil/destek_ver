import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaInput extends StatefulWidget {

  Image image;

  MediaInput(this.image);

  @override
  _MediaInputState createState() => _MediaInputState();
}

class _MediaInputState extends State<MediaInput> {

  File _pickedImage;

  Future<void> pickImage() async {
    final imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 500);

    if (imageFile == null) {
      return;
    }

    setState(() {
      _pickedImage = imageFile;
      widget.image = Image.file(imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: _pickedImage == null ? Container() : Container(
            width: 200,
            height: 200,
            child: Image.file(_pickedImage,fit: BoxFit.cover,),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: RaisedButton(
            color: Colors.blue[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              pickImage();
              },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.wallpaper,color: Colors.white,),
                SizedBox(width: 10,),
                Text("Medya Ekle",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

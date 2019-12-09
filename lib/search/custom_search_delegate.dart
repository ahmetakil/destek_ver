import 'package:DestekVer/models/complain.dart';
import 'package:DestekVer/screens/complain_screen.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {

  final List<Complain> complains;

  CustomSearchDelegate(this.complains);
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ComplainScreen(searchBarComplainScreen: true,);
  }
}

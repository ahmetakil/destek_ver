import 'package:flutter/material.dart';

import '../screens/complain_screen.dart';
import '../screens/profile_screen.dart';
import '../models/complain.dart';
import '../screens/new_complain.dart';

class TabsScreen extends StatefulWidget {
  final List<Complain> complains;
  final Function addComp;

  TabsScreen(this.complains, this.addComp);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  Widget _selectedPage() {
    if (_selectedPageIndex == 0) {
      return ComplainScreen(widget.complains);
    } else {
      return ProfileScreen(widget.complains);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _newComplainScreen() {
    Navigator.of(context).pushNamed(
      NewComplain.routeName,
      arguments: widget.addComp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DestekVer'),
      ),
      body: _selectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            title: Text('Şikayetler'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profil'),
          )
        ],
      ),
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _newComplainScreen,
            )
          : Container(),
    );
  }
}

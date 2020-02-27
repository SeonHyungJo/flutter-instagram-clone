import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramClone/account_page.dart';
import 'package:instagramClone/home_page.dart';
import 'package:instagramClone/search_page.dart';

class TabPage extends StatefulWidget {
  final FirebaseUser user;
 
  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIdx = 0;
  List _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      Accountpage(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIdx],),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIdx,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Sccount')),
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }
}
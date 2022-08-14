import 'package:flutter/material.dart';

import '../constants.dart';
import 'EmptyPage.dart';
import 'HomePage.dart';
import 'HomePage2.dart';

class HomeEntryPage extends StatefulWidget {
  const HomeEntryPage({Key? key}) : super(key: key);

  @override
  _thisPageState createState() => _thisPageState();
}

class _thisPageState extends State<HomeEntryPage> {
  //variables
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    // const HomePage2(),
    const EmptyPage(),
    const EmptyPage(),
    const Icon(
      Icons.settings,
      size: 150,
    ),
  ];

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // IndexedStack(
          //   index: _selectedIndex,
          //   children: _pages,
          // ),
          PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: GlobalConstants.APPPRIMARYCOLOUR,
        fixedColor: Colors.pink,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home2',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: 'Check-in',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

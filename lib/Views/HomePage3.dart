import 'package:flutter/material.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final double _iconSize = 20;
  static final Color? _iconColor = GlobalConstants.APPPRIMARYCOLOUR;
  final double _topNavBarHeight = 55;
  // final int _selectedIndex = 1;
  // static List<Widget> _pages = <Widget>[
  //   HomePage(),
  //   DepositPage(),
  //   Icon(
  //     Icons.ac_unit_rounded,
  //     size: 150,
  //   ),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.airplane_ticket),
              onPressed: () {},
            )
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: PreferredSize(
            preferredSize: Size.fromHeight(_topNavBarHeight),
            child: AppBar(
              backgroundColor: Colors.white,
              bottom: TabBar(
                //isScrollable: true,
                indicatorColor: GlobalConstants.APPPRIMARYCOLOUR,
                indicatorWeight: 5,
                tabs: [
                  Tab(icon: Icon(Icons.home, size: _iconSize, color: _iconColor,)),
                  Tab(icon: Icon(Icons.star, size: _iconSize, color: _iconColor,)),
                  Tab(icon: Icon(Icons.face, size: _iconSize, color: _iconColor,)),
                ],
              ),
              elevation: 10,
            ),
          ),
              body: TabBarView(
                children: [
                  buildPage('Home Page'),
                  buildPage('Feed Page'),
                  buildPage('Profile Page'),
                ],
              ),
          ),
        ));
  }

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );

}

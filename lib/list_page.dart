import 'package:coronavirusstatistics/country_page.dart';
import 'package:coronavirusstatistics/country_selection_page.dart';
import 'package:coronavirusstatistics/global_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      int currentIndex = _pageController.page.round();
      if (currentIndex != _selectedIndex) {
        _selectedIndex = currentIndex;

        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.language), title: Text("Global")),
          BottomNavigationBarItem(icon: Icon(Icons.outlined_flag), title: Text("Country"))
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          GlobalPage(),
          SelectionPage(),
          CountryPage()
        ],
      ),
    );
  }

  void _onTap(int value) {
    print(value);
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
import 'package:chasse_infos/pages/graph.dart';
import 'package:chasse_infos/pages/home.dart';
import 'package:chasse_infos/pages/listHuntPoint.dart';
import 'package:chasse_infos/pages/map.dart';
import 'package:chasse_infos/pages/scanAnimals.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class acceuil extends StatefulWidget {
  const acceuil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _acceuilPageState createState() => _acceuilPageState();
}

class _acceuilPageState extends State<acceuil> {
  int index = 2;

  final PageController _pageController = PageController(initialPage: 2);

  final screens = [
    scanAnimals(),
    graph(),
    home(),
    listHuntingPoint(),
    map(),
  ];

  @override
  Widget build(Object context) {
    final items = <Widget>[
      const Icon(Icons.camera_enhance, size: 30),
      const Icon(Icons.auto_graph, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.list_alt, size: 30),
      const Icon(Icons.map, size: 30),
    ];
    return Container(
      color: const Color(0xff8fc0a9),
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff4a7c59), Color(0xff52896e)])),
            child: Scaffold(
              extendBody: true,
              body: WillPopScope(
                onWillPop: () async => false,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (newIndex) => setState(() => index = newIndex),
                  scrollDirection: Axis.horizontal,
                  children: screens,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndTop,
              floatingActionButton: FloatingActionButton(
                onPressed: (() {}),
                backgroundColor: const Color(0xff8fc0a9),
                foregroundColor: const Color(0xfffaf3dd),
                child: const Icon(Icons.settings),
              ),
              backgroundColor: Colors.transparent,
              bottomNavigationBar: Theme(
                data: Theme.of(this.context).copyWith(
                    iconTheme: const IconThemeData(color: Color(0xfffaf3dd))),
                child: CurvedNavigationBar(
                    backgroundColor: Colors.transparent,
                    color: const Color(0xff8fc0a9),
                    height: 50,
                    animationCurve: Curves.easeInOutCirc,
                    animationDuration: const Duration(milliseconds: 300),
                    items: items,
                    index: index,
                    onTap: (index) => _pageController.jumpToPage(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/Pages/navigation_items.dart';

import '../utils/WindowUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedTabIndex = 0;

  void setSelectedTabIndex(int current) {
    setState(() {
      selectedTabIndex = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Scaffold(
        appBar: _createAppBar(constraints),
        body: _createBody(constraints),
        drawer: _createDrawer(constraints),
      ),
    );
  }

  AppBar? _createAppBar(BoxConstraints constraints) {
    if (isDesktop(constraints)) {
      return null;
    } else {
      return AppBar(
        title: Text(widget.title),
      );
    }
  }

  Row _createBody(BoxConstraints constraints) {
    var page = Container();

    if (isDesktop(constraints)) {
      return Row(
        children: [
          NavigationRail(
            destinations: [
              ...navItems.map((item) => NavigationRailDestination(
                  icon: Icon(item.icon), label: Text(item.label)))
            ],
            selectedIndex: selectedTabIndex,
            onDestinationSelected: (index) {
              setSelectedTabIndex(index);
            },
          ),
          page
        ],
      );
    } else {
      return Row(
        children: [page],
      );
    }
  }

  NavigationDrawer? _createDrawer(BoxConstraints constraints) {
    if (isDesktop(constraints)) {
      return null;
    } else {
      return NavigationDrawer(
        selectedIndex: selectedTabIndex,
        children: [
          ...navItems.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: DrawerItem(
                  item: item, onTap: () => {}, key: Key(item.label))))
        ],
        onDestinationSelected: (index) {
          setSelectedTabIndex(index);
        },
      );
    }
  }
}

class DrawerItem extends StatelessWidget {
  final NavItem item;
  final void Function() onTap;

  const DrawerItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        radius: 50,
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Expanded(
                child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(item.icon),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(item.label)
                      ],
                    )))));
  }
}

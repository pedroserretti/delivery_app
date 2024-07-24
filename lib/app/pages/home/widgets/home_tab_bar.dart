import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  final TabController tabController;
  const HomeTabBar({super.key, required this.tabController});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      tabs: const [
        Tab(
          child: Icon(Icons.abc),
        ),
        Tab(
          child: Icon(Icons.av_timer),
        ),
        Tab(
          child: Icon(Icons.abc_outlined),
        )
      ],
    );
  }
}

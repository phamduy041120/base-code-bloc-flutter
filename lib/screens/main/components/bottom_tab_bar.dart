import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../resources/gen/colors.gen.dart';
import '../models/main_tab.dart';
import 'tab_item.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    required this.tabsRouter,
    super.key,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: ColorName.grayFAFAFA,
      child: Row(
        children: [
          MainTab.home,
          MainTab.video,
          MainTab.marketplace,
          MainTab.dating,
          MainTab.notification,
          MainTab.menu,
        ].map((tab) {
          return TabItem(
            mainTab: tab,
            isActive: tab.index == tabsRouter.activeIndex,
            onTap: () => tabsRouter.setActiveIndex(tab.index),
          );
        }).toList(),
      ),
    );
  }
}

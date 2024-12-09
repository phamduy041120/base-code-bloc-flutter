import 'package:flutter/cupertino.dart';

import '../../../resources/gen/assets.gen.dart';
import '../../../utilities/constants/text_constants.dart';

enum MainTab {
  home,
  video,
  marketplace,
  dating,
  notification,
  menu,
}

extension MainTabExtension on MainTab {
  String getLabel(BuildContext context) {
    switch (this) {
      case MainTab.home:
        return TextConstants.home;
      case MainTab.video:
        return TextConstants.video;
      case MainTab.marketplace:
        return TextConstants.marketplace;
      case MainTab.dating:
        return TextConstants.dating;
      case MainTab.notification:
        return TextConstants.notification;
      case MainTab.menu:
        return TextConstants.menu;
    }
  }

  String iconPath(BuildContext context) {
    switch (this) {
      case MainTab.home:
        return Assets.icons.home.path;
      case MainTab.video:
        return Assets.icons.video.path;
      case MainTab.marketplace:
        return Assets.icons.market.path;
      case MainTab.dating:
        return Assets.icons.love.path;
      case MainTab.notification:
        return Assets.icons.notification.path;
      case MainTab.menu:
        return Assets.icons.menu.path;
    }
  }

  String activeIconPath(BuildContext context) {
    switch (this) {
      case MainTab.home:
        return Assets.icons.homeOn.path;
      case MainTab.video:
        return Assets.icons.videoOn.path;
      case MainTab.marketplace:
        return Assets.icons.marketOn.path;
      case MainTab.dating:
        return Assets.icons.loveOn.path;
      case MainTab.notification:
        return Assets.icons.notificationOn.path;
      case MainTab.menu:
        return Assets.icons.menu.path;
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import 'components/bottom_tab_bar.dart';

/// Screen code: A_03
@RoutePage()
class MainScreen extends BaseView {
  const MainScreen({super.key});

  @override
  BaseViewState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BaseViewState<MainScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  bool get ignoreSafeAreaBottom => false;

  @override
  Widget buildBody(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTabRoute(),
        VideoTabRoute(),
        MarketplaceTabRoute(),
        DatingTabRoute(),
        NotificationTabRoute(),
        MenuTabRoute(),
      ],
      resizeToAvoidBottomInset: true,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomTabBar(tabsRouter: tabsRouter);
      },
    );
  }

  @override
  String get screenName => MainRoute.name;
}

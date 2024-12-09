import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_09
@RoutePage()
class MenuScreen extends BaseView {
  const MenuScreen({super.key});

  @override
  BaseViewState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends BaseViewState<MenuScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(TextConstants.menu),
    );
  }

  @override
  String get screenName => MenuRoute.name;
}

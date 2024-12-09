import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_08
@RoutePage()
class NotificationScreen extends BaseView {
  const NotificationScreen({super.key});

  @override
  BaseViewState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseViewState<NotificationScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(TextConstants.notification),
    );
  }

  @override
  String get screenName => NotificationRoute.name;
}

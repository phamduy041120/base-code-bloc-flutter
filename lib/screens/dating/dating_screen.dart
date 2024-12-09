import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_07
@RoutePage()
class DatingScreen extends BaseView {
  const DatingScreen({super.key});

  @override
  BaseViewState<DatingScreen> createState() => _DatingScreenState();
}

class _DatingScreenState extends BaseViewState<DatingScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(TextConstants.dating),
    );
  }

  @override
  String get screenName => DatingRoute.name;
}

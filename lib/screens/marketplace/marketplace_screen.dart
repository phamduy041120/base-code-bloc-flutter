import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_06
@RoutePage()
class MarketplaceScreen extends BaseView {
  const MarketplaceScreen({super.key});

  @override
  BaseViewState<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends BaseViewState<MarketplaceScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(TextConstants.marketplace),
    );
  }

  @override
  String get screenName => MarketplaceRoute.name;
}

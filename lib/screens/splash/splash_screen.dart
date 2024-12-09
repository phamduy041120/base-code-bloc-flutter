import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../resources/gen/assets.gen.dart';
import '../../router/app_router.dart';

/// Screen code: A_01
@RoutePage()
class SplashScreen extends BaseView {
  const SplashScreen({super.key});

  @override
  BaseViewState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseViewState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      await AutoRouter.of(context).replace(
        const LoginRoute(),
      );
    });
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Assets.images.facebookLogo.image(
        width: 60,
        height: 60,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  String get screenName => SplashRoute.name;
}

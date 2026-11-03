import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_05
@RoutePage()
class VideoScreen extends BaseView {
  const VideoScreen({super.key});

  @override
  BaseViewState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends BaseViewState<VideoScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(TextConstants.video),
    );
  }

  @override
  String get screenName => VideoRoute.name;
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_bar/menu_app_bar.dart';
import '../../components/base_view/base_view.dart';
import '../../components/divider/divider_horizontal.dart';
import '../../components/loading/loading.dart';
import '../../data/blocs/common/common_state.dart';
import '../../data/blocs/home/home_bloc.dart';
import '../../data/blocs/home/home_event.dart';
import '../../data/blocs/home/home_state.dart';
import '../../data/models/api/responses/post/post.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/app_constants.dart';
import '../../utilities/constants/text_constants.dart';
import 'components/create_post.dart';
import 'components/create_story.dart';
import 'components/post_item.dart';
import 'components/story_item.dart';

/// Screen code: A_04
@RoutePage()
class HomeScreen extends BaseView {
  const HomeScreen({super.key});

  @override
  BaseViewState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseViewState<HomeScreen> {
  late HomeBloc _homeBloc;

  @override
  Future<void> onInitState() async {
    super.onInitState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(FetchAll(showError: handleError));
  }

  @override
  void onDispose() {
    _homeBloc.close();
    super.onDispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => MenuAppBar(
        title: TextConstants.facebook,
        onAddIconTap: () {},
        onSearchIconTap: () {},
        onMessengerIconTap: () {},
      );

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CreatePost(
                      imageUrl: AppConstants.userNameImage,
                      onOpenProfileTap: () {},
                      onOpenPostTap: () {},
                      onOpenPhotosTap: () {},
                      onLiveTap: () {},
                      onPhotoTap: () {},
                      onRoomTap: () {},
                    ),
                    const DividerHorizontal(height: 5),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: _buildStoryListData(state),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = state.postList[index];
                    return PostItem(
                      post: post,
                      onMoreTap: () {},
                      onClosePostTap: () {},
                      onStatusIconTap: () {},
                      onLikeTap: () {},
                      onCommentsTap: () {},
                      onShareTap: () {},
                    );
                  },
                  childCount: state.postList.length,
                ),
              )
            ],
          ),
          Loading(visible: state.isLoading == StateLoading.loading)
        ],
      );
    });
  }

  Widget _buildStoryListData(HomeState state) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: state.storyList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CreateStory(
                  onCreateStoryTap: () {},
                );
              }
              final story = state.storyList[index - 1];
              return StoryItem(story: story);
            },
          ),
        ),
        const DividerHorizontal(height: 5),
      ],
    );
  }

  @override
  String get screenName => HomeRoute.name;
}

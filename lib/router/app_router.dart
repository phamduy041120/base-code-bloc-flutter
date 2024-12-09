import 'package:auto_route/auto_route.dart';

import '../screens/dating/dating_screen.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/marketplace/marketplace_screen.dart';
import '../screens/menu/menu_screen.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/video/video_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: '/forgotPassword',
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: '/register',
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: HomeTabRoute.page,
              path: 'homeTab',
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
            AutoRoute(
              page: VideoTabRoute.page,
              path: 'videoTab',
              children: [
                AutoRoute(
                  page: VideoRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
            AutoRoute(
              page: MarketplaceTabRoute.page,
              path: 'marketPlaceTab',
              children: [
                AutoRoute(
                  page: MarketplaceRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
            AutoRoute(
              page: DatingTabRoute.page,
              path: 'datingTab',
              children: [
                AutoRoute(
                  page: DatingRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
            AutoRoute(
              page: NotificationTabRoute.page,
              path: 'notificationTab',
              children: [
                AutoRoute(
                  page: NotificationRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
            AutoRoute(
              page: MenuTabRoute.page,
              path: 'menuTab',
              children: [
                AutoRoute(
                  page: MenuRoute.page,
                  path: '',
                ),
                // inspection child page define here
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'HomeTabRoute')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'VideoTabRoute')
class VideoTabPage extends AutoRouter {
  const VideoTabPage({super.key});
}

@RoutePage(name: 'MarketplaceTabRoute')
class MarketplaceTabPage extends AutoRouter {
  const MarketplaceTabPage({super.key});
}

@RoutePage(name: 'DatingTabRoute')
class DatingTabPage extends AutoRouter {
  const DatingTabPage({super.key});
}

@RoutePage(name: 'NotificationTabRoute')
class NotificationTabPage extends AutoRouter {
  const NotificationTabPage({super.key});
}

@RoutePage(name: 'MenuTabRoute')
class MenuTabPage extends AutoRouter {
  const MenuTabPage({super.key});
}

final appRouter = AppRouter();

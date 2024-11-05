import 'package:braekingbad/featrues/home/view/screens/homePage.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static var router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context,  state) {
        return const Homepage();
      },
    ),
   
  ]);
}

import 'package:flutter/material.dart';
import 'package:super_up_admin/src/modules/home_tabs/users/users_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../user_page/user_page.dart';
import 'users_controller.dart';
final usersKey = GlobalKey<NavigatorState>();
class UsersNestedNavigator extends StatefulWidget {
  const UsersNestedNavigator({Key? key}) : super(key: key);

  @override
  State<UsersNestedNavigator> createState() => _UsersNestedNavigatorState();
}

class _UsersNestedNavigatorState extends State<UsersNestedNavigator> {
  final controller = UsersController();


  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: usersKey,
      onGenerateRoute: _onGenerateRoute,
      initialRoute: "/",
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return PageRouteBuilder(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              UsersPage(controller: controller),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
      case "/user":
        return PageRouteBuilder(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const UserPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
      default:
    }
    return null;
  }
}




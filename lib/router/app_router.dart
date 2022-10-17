import 'package:flutter/material.dart' show Widget, BuildContext, Icons;
import 'package:flutter_base_basic_app/models/models.dart';
import 'package:flutter_base_basic_app/screens/example_admin_screen.dart';
import 'package:flutter_base_basic_app/screens/screens.dart';

class AppRouter {
  static const initialRoute = 'home';

  static final routerOptions = <RouterOption>[
    RouterOption(
      route: 'home',
      widget: const HomeScreen()
    ),
    RouterOption(
      route: 'example-admin',
      widget: const ExampleAdminScreen()
    ),
  ];

  static final menuOptions = <MenuOption>[

    MenuOption(
      route: 'example-admin',
      name: 'Ejemplo',
      widget: const ExampleAdminScreen(),
      icon: Icons.add_a_photo
    ),
  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (var option in routerOptions) {
      routes.addAll({option.route: (BuildContext context) => option.widget});
    }
    return routes;
  }

  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   return MaterialPageRoute(builder: (context) => const AlertScreen());
  // }
}



import 'package:get/get.dart';

class RouteApp {
  static String initial = '/';

  static List<GetPage> routes = [
    GetPage(
      name: initial, 
      page: () => const MainMenuScreen(),
      )
  ];
}
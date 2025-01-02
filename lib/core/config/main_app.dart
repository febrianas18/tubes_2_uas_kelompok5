
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/route_utils.dart';

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteApp.routes,
      initialRoute: RouteApp.initial,
    );
  }
}
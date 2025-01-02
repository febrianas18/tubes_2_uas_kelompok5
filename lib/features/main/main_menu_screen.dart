import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/main_menu_controller.dart';
import 'widgets/bottom_nav.dart';

class MainMenuScreen extends StatelessWidget{
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi MainMenuController
    final MainMenuController controller = Get.put(MainMenuController());

    return Scaffold(
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

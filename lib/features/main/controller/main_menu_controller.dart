import 'package:get/get.dart';

import '../../home/home_screen.dart';
import '../../favorite/favorite_screen.dart';
import '../../vote/vote_screen.dart';


class MainMenuController extends GetxController {
  var currentIndex = 0.obs;
  
  // List of pages for BottomNavigationBar
  final List pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const VoteScreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
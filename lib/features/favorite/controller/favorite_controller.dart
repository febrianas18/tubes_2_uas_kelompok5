import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/datasource/favorit_datasource.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class VoteController extends GetxController {
  final FavoriteDatasource _datasource = FavoriteDatasource();
  RxList<FavoritesResponsesModelGet> Favorite =
      <FavoritesResponsesModelGet>[].obs;
  RxList<FavoritesResponsesModelGet> searchResults =
      <FavoritesResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchVote();
  }

  Future<void> fetchVote() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getVote();
      if (result != null) {
        Favorite.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void searchVote(String query) {
    if (query.isEmpty) {
      searchResults.value = favorites;
    } else {
      searchResults.value = Favorites.where((element) =>
              element.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> deleteVote(int id) async {
    try {
      final result = await _datasource.deleteVote(id);
      if (result != null) {
        Favorite.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete vote: $e");
    }
  }
}

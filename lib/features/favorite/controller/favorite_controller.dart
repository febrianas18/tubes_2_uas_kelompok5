import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/favorite_responses_model_get.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/datasource/vote_datasource.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model_get.dart';

class VoteController extends GetxController {
  final VoteDatasource _datasource = VoteDatasource();
  RxList<FavoritesResponsesModelGet> Favorite =
      <FavoritesResponsesModelGet>[].obs;
  RxList<FavoritesResponsesModelGet> searchResults =
      <FavoritesResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchFavorite();
  }

  Future<void> fetchFavorite() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getFavrites();
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
      searchResults.value = Favorite;
    } else {
      searchResults.value = Favorite.where((element) =>
              element.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> deleteFavorie(int id) async {
    try {
      final result = await _datasource.deleteFavorit(id);
      if (result != null) {
        Favorite.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete Favorite: $e");
    }
  }
}

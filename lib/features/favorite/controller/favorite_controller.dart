
import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/favorite_responses_model_get.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/vote_responses_model_get.dart';

Favorite_responses_model_get.dart;';
class FavoriteController extends GetxController{
   final FavoriteDatasource _datasource = FavoriteDatasource();
  RxList<FavoritesResponsesModelGet> vote = <FavoriteResponsesModelGet>[].obs;
  RxList<VoteResponsesModelGet> searchResults = <FavoriteResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchFavorite();
}
  Future<void> fetchFavorite() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getFavorite();
      if (result != null) {
        favorite.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
  void searchFavorite(String query) {
    if (query.isEmpty) {
      searchResults.value = favorites;
    } else {
      searchResults.value = favorits.where((element) =>element.id.toString().toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
Future<void> deleteVote(int id) async {
    try {
      final result = await _datasource.deleteVote(id);
      if (result != null) {
        vote.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete vote: $e");
      }
  }
}
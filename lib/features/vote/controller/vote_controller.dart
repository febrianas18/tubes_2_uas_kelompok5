import 'package:get/get.dart';
import 'package:tubes_2_uas_kelompok5/core/utils/print_log.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes_2_uas_kelompok5/data/favorite/responsesmodel/favorite_responses_model.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/datasource/vote_datasource.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model.dart';

class VoteController extends GetxController {
  final VoteDatasource _datasource = VoteDatasource();
  RxList<VoteResponsesModel> vote = <VoteResponsesModel>[].obs;
  RxList<VoteResponsesModel> searchResult = <VoteResponsesModel>[].obs;
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
        vote.value = result;
      }
    } catch (e) {
      printLog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void searchVote(String query) {
  if (query.isEmpty) {
    searchResult.value = vote;
  } else {
    searchResult.value = vote.where((element) => element.id.toString().contains(query)).toList();
  }
}

Future<void> deleteVote(int id) async {
  try {
    final result = await _datasource.deleteVote(id);
    if (result != null) {
      vote.removeWhere((element) => element.id == id);
      searchResult.removeWhere((element) => element.id == id);
    }
  } catch (e) {
    print("Error deleting vote: $e");
  }
}
import 'package:cat_app/data/favorite/datasource/favorite_datasource.dart';
import 'package:cat_app/data/favorite/requestsmodel/favorite_requests_model.dart';
import 'package:cat_app/data/vote/datasource/vote_datasource.dart';
import 'package:get/get.dart';
import '../../../data/breeds/datasource/breeds_datasource.dart';
import '../../../data/breeds/responsesmodel/breeds_responses_model.dart';
import '../../../data/vote/requestsmodel/vote_requests_model.dart';

class HomeController extends GetxController {
  final BreedsDatasource _datasource = BreedsDatasource(); // Image datasource
  final VoteDatasource _voteDatasource = VoteDatasource(); // Vote datasource
  final FavoriteDatasource _favoriteDatasource = FavoriteDatasource(); // Favorite datasource
  var images = <BreedsResponsesModel>[].obs; // Observable list of images

  @override
  void onInit() {
    super.onInit();
    fetchImages(); // Fetch images when controller is initialized
  }

  Future<void> fetchImages() async {
    try {
      var fetchedImages = await _datasource.getbreeds();
      images.value = fetchedImages; // Update observable list
     // PrintLog.printLog('Fetched images: ${images.length}');
    } catch (e) {
     // PrintLog.printLog('Error fetching images: $e');
    }
  }

  void handleFavoritePressed(String imageId) {
    final favorite = FavoriteRequestsModel(imageId: imageId, subId: 'test_i1');
   // PrintLog.printLog('Favorite pressed for ID: $imageId');
    _favoriteDatasource.createFavorite(favorite); // Toggle favorite status
  }

  void handleLikePressed(String id) {
    final vote = VoteRequestsModel(imageId: id, subId: 'test_i1', value: 1);
    _voteDatasource.createVote(vote); // Create a vote
   // PrintLog.printLog('Like pressed for ID: $id');
  }
}

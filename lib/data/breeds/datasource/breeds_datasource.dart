import 'package:tubes_2_uas_kelompok5/core/api_services/dio_module.dart';
import 'package:tubes_2_uas_kelompok5/core/api_services/endpoint.dart';
import 'package:tubes_2_uas_kelompok5/data/breeds/responsesmodel/breeds_responses_model.dart';

class BreedsDatasource {
  final HttpManager _httpManager = HttpManager();

  Future<List<BreedsResponsesModel>> getBreeds() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.breedGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,

      );
      PrintLog.printLog("getImages datasource responses : ${response}");

      if (response['statusCode'] == 200){
        final List<dynamic> data = response['data' ];

        if (data is List){
          return data
          .map((imageData)=> BreedsResponsesModel.fromJson(imageData))
          .toList();
        } else {
          throw Exception('Data is not a list');
        }
      } else {
        throw Exception('Failed to load breeds : ${response['statusMessage']}');
      }
    } catch (e){
      throw Exception('Failed to load brreds : $e')
    }
  }
}

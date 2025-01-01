import 'package:tubes_2_uas_kelompok5/core/utils/print_log.dart';
import 'package:tubes_2_uas_kelompok5/core/api_services/dio_module.dart';
import 'package:tubes_2_uas_kelompok5/core/api_services/endpoint.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model_delete.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model_get.dart';
import 'package:tubes_2_uas_kelompok5/data/vote/responsesmodel/vote_responses_model_post.dart';
import 'package:tubes_2_uas_kelompok5/core/utils/print_log.dart';

class VoteDatasource {
  final HttpManager _httpManager = HttpManager();

  Future<List<VoteResponsesModelGet>> getVote() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
        );

    // Printlog.printlog('getVote DataSource response: $response');

      if (response['statuscode'] == 200 && response.containsKey('data')) {
        final List<dynamic> data = response['data'];        ]

        return data.map(
          (item) {
          if (item['image'] == null || itemm['image'].isEmpty) {
            item['image'] = {'id': '',
            'url': ''
            };
          }
          return VoteResponsesModelGet.fromJson(item);
        }
        ).toList();

      }else {
        throw Exception('Failed to load getVote: Invalid response format');
      }
    } catch (e) {
      throw Exception('Failed to load getVote');
    }
  }
  Future<VoteResponsesModelPost?> createFavourite(
      VoteRequestsModel data) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.post,
        body: data.toJson()
        );

        final statusCode = response['statusCode'];
        final statusMessage = response['statusMessage'];
        
        if (statusCode == 200 || statusCode == 201) {
          if (response['data'] != null &&
              response['data'] is Map<String, dynamic>) {
              
            return voteResponsesModelPost.fromJson(response['data']);
          } else {
            return VoteResponsesModelDelete(
            message: message ?? "SUCCESS",
            );
          }
        } else {
          return null;
        }
        } catch (e) {
        return null;
        }
      }

  deleteFavorit(int id) {}

  getFavrites() {}
    }

  Future<voteResponsesModelSearch?> searchFavourite(int vote_id) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.voteByIdGetEndpoint(vote_id),
      useAuth: true,
      method: HttpMethods.get,
      );

      if (response['statusCode'] == 200) {
         
          return voteResponsesModelSearch.fromJson(response['data']);
        } else {
          return null;
        }
      } catch (e) {
        return null;
        }
      }

Future<FavoritesResponsesModelDelete?> deleteFavorite(int favoriteId) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favByIdGetEndpoint(favoriteId),
      method: HttpMethods.delete,
      useAuth: true,
    );

    final message = response['message'];
    final statusMessage = response['statusMessage'];

    if (message == 'SUCCESS' || statusMessage == 'OK') {
      if (response['data'] != null &&
          response['data'] is Map<String, dynamic>) {
        return FavoritesResponsesModelDelete.fromJson(response['data']);
        } else {
        return FavoritesResponsesModelDelete(
          message: message ?? 'SUCCESS',
        );
        }
      } else {
      return FavoritesResponsesModelDelete(
        message: message ?? 'FAILED',
      );
      }
    } catch (e, stackTrace) {
    // Tangani error di sini
    print('Error in deleteFavorite: $e');
    print('Stack trace: $stackTrace');
    return null;
    }
  }
}
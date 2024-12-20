// final favoritesResponsesModel = favoritesResponsesModelFromJson(json);

import 'dart:convert';

FavoritesResponsesModelPost favoritesResponsesModelFromJson(String str) =>
    FavoritesResponsesModelPost.fromJson(json.decode(str));

String favoritesResponsesModelToJson(FavoritesResponsesModelPost data) =>
    json.encode(data.toJson());

class FavoritesResponsesModelPost {
  String message;
  int id;

  FavoritesResponsesModelPost({
    required this.message,
    required this.id,
  });

  factory FavoritesResponsesModelPost.fromJson(Map<String, dynamic> json) =>
      FavoritesResponsesModelPost(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}

Future<FavoritesResponsesModelDelete?> deleteFavorite(int favoriteId) async {
  try {
    final response = await _httpManager.restRequest(
      url: ApiConstants.favByIdGetEndpoint(favoriteId),
      method: HttpMethods.delete,
      useAuth: true,
    );

    if (response['statusCode'] == 200) {
      PrintLog.printLog("createFavorite Datasource response: ${response}");
      return FavoritesResponsesModelDelete.fromJson(response['data']);
    } else {
      PrintLog.printLog(
          "createFavorite Datasource response: ${response['statusMessage']}");
      return null;
    }
  } catch (e) {
    throw Exception('failed to load create Favorite');
  }
}
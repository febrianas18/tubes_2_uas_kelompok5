import 'package:meta/meta.dart'; // Unused import
import 'dart:convert';

FavoritesResponsesModelPost favoritesResponsesModelPostFromJson(String str) =>
    FavoritesResponsesModelPost.fromJson(json.decode(str));

String favoritesResponsesModelPostToJson(FavoritesResponsesModelPost data) =>
    json.encode(data.toJson());

class FavoritesResponsesModelPost {
  final String message;
  final int id;

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
//
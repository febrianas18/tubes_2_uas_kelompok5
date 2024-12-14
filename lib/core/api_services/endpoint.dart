class ApiConstants {
  static const String baseUrl = 'https://api.thecatapi.com/v1';
  static String breedGetEndpoint = '$baseUrl/breeds';
  static String favoriteGetEndpoint = '$baseUrl/favourites';
  static String favByIdGetEndpoint(int favoriteId) =>
      '$favoriteGetEndpoint/$favoriteId';
  static String voteGetEndpoint = '$baseUrl/votes';
  static String voteByIdGetEndpoint(int voteId) => '$voteGetEndpoint/$voteId';
  static String baseUrlImageCats = 'https://cdn2.thecatapi.com/images/';
}

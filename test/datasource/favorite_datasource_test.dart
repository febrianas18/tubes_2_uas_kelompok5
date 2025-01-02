import 'package:flutter_test/flutter_test.dart';
import 'package:tubes_2_uas_kelompok5/data/breeds/datasource/breeds_datasource.dart';

import '../../lib/data/favorite/datasource/favorite_datasource.dart';
import '../../lib/data/favorite/responsesmodel/favorite_responses_model_get.dart';

void main() {
  group('favorite Datasource test', () {
    late FavoriteDataSource favoriteDataSource;

    setUp(() {
      favoriteDataSource = favoriteDataSource();
    });

    test('get Favorite return correct data when successfully', () async {
      final response = await favoriteDataSource.getFavorite();

      expect(response.length, greaterThan(0));

      expect(response[0].id, isNotNull);
    });

    test('create Favorite return correct data when successfully', () async {
      final favoritesReqModel = FavoritesRequestModelPost(
        imageId: 'abys',
        subId: 'fauzan_123',
      );

      final response =
          await favoriteDataSource.createFavorite(favoritesReqModel);
      if (response != null) {
        expect(response.message, equals('SUCCESS'));
      } else {
        fail('Response was null');
      }
    });

    test('search Favorite return correct data when successfully', () async {
      final favoriteId = 232501209;

      final response = await favoriteDataSource.searchFavorite(favoriteId);
      if (response != null) {
        expect(response.id, equals(favoriteId));
      } else {
        fail('Response was null');
      }
    });

    test('Delete Favorite return correct data when successfully', () async {
      final favoriteId = 232501209;

      final response = await favoriteDataSource.deleteFavorite(favoriteId);
      expect(response.id, equals('SUCCESS'));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tubes_2_uas_kelompok5/data/breeds/datasource/breeds_datasource.dart';
import '../../lib/data/favorite/datasource/favorite_datasource.dart';
import '../../lib/data/favorite/responsesmodel/favorite_responses_model_get.dart';
import '../../lib/data/vote/datasource/vote_datasource.dart';

void main() {
  group('vote Datasource test', () {
    late VoteDatasource voteDataSource;

    setUp(() {
      voteDataSource = voteDataSource();
    });

    test('get Vote return correct data when successfully', () async {
      final response = await voteDataSource.getVote();

      expect(response.length, greaterThan(0));

      expect(response[0].id, isNotNull);
    });

    test('create Vote return correct data when successfully', () async {
      final VoteReqModel = VoteRequestModel(
        imageId: 'aege',
        subId: 'fauzan_1444',
        value: 1,
      );

      final response =
          await voteDataSource.createVote(VoteReqModel);
          
              expect(response.message, equals('SUCCESS'));
    });

    test('search Vote return correct data when successfully', () async {
      final voteId = 232501209;

      final response = await voteDataSource.searchVote(voteId);
      if (response != null) {
        expect(response.id, equals(voteId));
      } else {
        fail('Response was null');
      }
    });

    test('Delete Vote return correct data when successfully', () async {
      final voteId = 232501209;

      final response = await voteDataSource.deleteVote(voteId);
      expect(response.id, equals('SUCCESS'));
    });
  });
}

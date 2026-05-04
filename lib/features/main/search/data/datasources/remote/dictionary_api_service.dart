import 'package:chopper/chopper.dart';
import '../../models/dictionary_word_model.dart';

part 'dictionary_api_service.chopper.dart';

@ChopperApi(baseUrl: "/api/v2/entries/en")
abstract class DictionaryApiService extends ChopperService {
  @GET(path: '/{word}')
  // Future<Response<List<DictionaryWordModel>>> getWordsDetails(
  //   @Path('word') String word,
  // );
  Future<Response> getWordsDetails(
      @Path('word') String word,
      );

  static DictionaryApiService create([ChopperClient? client]) =>
      _$DictionaryApiService(client);
}
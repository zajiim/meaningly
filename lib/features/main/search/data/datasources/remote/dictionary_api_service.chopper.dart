// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'dictionary_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DictionaryApiService extends DictionaryApiService {
  _$DictionaryApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DictionaryApiService;

  @override
  Future<Response<List<DictionaryWordModel>>> getWordsDetails(String word) {
    final Uri $url = Uri.parse('/api/v2/entries/en/${word}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<List<DictionaryWordModel>, DictionaryWordModel>(
      $request,
    );
  }
}

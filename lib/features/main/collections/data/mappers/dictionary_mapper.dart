// inside your mappers file

import '../../../search/domain/entities/dictionary_word_entity.dart';

extension OfflineMapping on String {
  DictionaryWordEntity toEntityFromOffline(String word) {
    return DictionaryWordEntity(
      word: word,
      phonetic: "",
      phonetics: const [],
      meanings: [
        Meaning(
          partOfSpeech: "noun",
          synonyms: const [],
          antonyms: const [],
          definitions: [
            Definition(
              definition: this,
              synonyms: const [],
              antonyms: const [],
              example: null,
            ),
          ],
        ),
      ],
      license: null,
      sourceUrls: const [],
    );
  }
}
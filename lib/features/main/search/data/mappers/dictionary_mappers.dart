

import '../../domain/entities/dictionary_word_entity.dart';
import '../models/dictionary_word_model.dart';

extension DictionaryWordModelMapper on DictionaryWordModel {
  DictionaryWordEntity toEntity() {
    return DictionaryWordEntity(
      word: word,
      phonetic: phonetic,
      phonetics: phonetics?.map((e) => e.toEntity()).toList(),
      meanings: meanings?.map((e) => e.toEntity()).toList(),
      license: license?.toEntity(),
      sourceUrls: sourceUrls,
    );
  }
}

extension MeaningModelMapper on MeaningModel {
  Meaning toEntity() {
    return Meaning(
      partOfSpeech: partOfSpeech,
      definitions: definitions?.map((e) => e.toEntity()).toList(),
      synonyms: synonyms,
      antonyms: antonyms,
    );
  }
}

extension DefinitionModelMapper on DefinitionModel {
  Definition toEntity() {
    return Definition(
      definition: definition,
      synonyms: synonyms,
      antonyms: antonyms,
      example: example,
    );
  }
}

extension PhoneticModelMapper on PhoneticModel {
  Phonetic toEntity() {
    return Phonetic(
      text: text,
      audio: audio,
      sourceUrl: sourceUrl,
      license: license?.toEntity(),
    );
  }
}

extension LicenseModelMapper on LicenseModel {
  License toEntity() {
    return License(
      name: name,
      url: url,
    );
  }
}
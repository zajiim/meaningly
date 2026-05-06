import '../../../search/data/models/dictionary_word_model.dart';
import '../../../search/domain/entities/dictionary_word_entity.dart';

extension DictionaryWordEntityMapper on DictionaryWordEntity {
  DictionaryWordModel toModel() {
    return DictionaryWordModel(
      word: word,
      phonetic: phonetic,
      phonetics: phonetics?.map((e) => e.toModel()).toList(),
      meanings: meanings?.map((e) => e.toModel()).toList(),
      license: license?.toModel(),
      sourceUrls: sourceUrls,
    );
  }
}

extension MeaningEntityMapper on Meaning {
  MeaningModel toModel() {
    return MeaningModel(
      partOfSpeech: partOfSpeech,
      definitions: definitions?.map((e) => e.toModel()).toList(),
      synonyms: synonyms,
      antonyms: antonyms,
    );
  }
}

extension DefinitionEntityMapper on Definition {
  DefinitionModel toModel() {
    return DefinitionModel(
      definition: definition,
      synonyms: synonyms,
      antonyms: antonyms,
      example: example,
    );
  }
}

extension PhoneticEntityMapper on Phonetic {
  PhoneticModel toModel() {
    return PhoneticModel(
      text: text,
      audio: audio,
      sourceUrl: sourceUrl,
      license: license?.toModel(),
    );
  }
}

extension LicenseEntityMapper on License {
  LicenseModel toModel() {
    return LicenseModel(
      name: name,
      url: url,
    );
  }
}
class DictionaryWordEntity {
  final String? word;
  final String? phonetic;
  final List<Phonetic>? phonetics;
  final List<Meaning>? meanings;
  final License? license;
  final List<String>? sourceUrls;

  const DictionaryWordEntity({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });
  // factory DictionaryWordEntity.fromLocalDictionary(String word, String definition) {
  //   return DictionaryWordEntity(
  //     word: word,
  //     phonetics: [],
  //     meanings: [
  //       Meaning(
  //         partOfSpeech: 'noun',
  //         definitions: [
  //           Definition(definition: definition),
  //         ],
  //       )
  //     ],
  //   );
  // }
}



class Meaning {
  final String? partOfSpeech;
  final List<Definition>? definitions;
  final List<String>? synonyms;
  final List<String>? antonyms;

  const Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });
}

class Definition {
  final String? definition;
  final List<String>? synonyms;
  final List<String>? antonyms;
  final String? example;

  const Definition({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });
}

class Phonetic {
  final String? text;
  final String? audio;
  final String? sourceUrl;
  final License? license;

  const Phonetic({
    this.text,
    this.audio,
    this.sourceUrl,
    this.license,
  });
}

class License {
  final String? name;
  final String? url;

  const License({
    this.name,
    this.url,
  });
}
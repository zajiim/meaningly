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

  // factory DictionaryWordEntity.fromJson(Map<String, dynamic> json) {
  //   return DictionaryWordEntity(
  //     word: json['word'],
  //     phonetic: json['phonetic'],
  //     phonetics: (json['phonetics'] as List?)
  //         ?.map((e) => Phonetic.fromJson(e))
  //         .toList(),
  //     meanings: (json['meanings'] as List?)
  //         ?.map((e) => Meaning.fromJson(e))
  //         .toList(),
  //     license:
  //     json['license'] != null ? License.fromJson(json['license']) : null,
  //     sourceUrls: (json['sourceUrls'] as List?)?.cast<String>(),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'word': word,
  //     'phonetic': phonetic,
  //     'phonetics': phonetics?.map((e) => e.toJson()).toList(),
  //     'meanings': meanings?.map((e) => e.toJson()).toList(),
  //     'license': license?.toJson(),
  //     'sourceUrls': sourceUrls,
  //   };
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

  // factory Meaning.fromJson(Map<String, dynamic> json) {
  //   return Meaning(
  //     partOfSpeech: json['partOfSpeech'],
  //     definitions: (json['definitions'] as List?)
  //         ?.map((e) => Definition.fromJson(e))
  //         .toList(),
  //     synonyms: (json['synonyms'] as List?)?.cast<String>(),
  //     antonyms: (json['antonyms'] as List?)?.cast<String>(),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'partOfSpeech': partOfSpeech,
  //     'definitions': definitions?.map((e) => e.toJson()).toList(),
  //     'synonyms': synonyms,
  //     'antonyms': antonyms,
  //   };
  // }
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

  // factory Definition.fromJson(Map<String, dynamic> json) {
  //   return Definition(
  //     definition: json['definition'],
  //     synonyms: (json['synonyms'] as List?)?.cast<String>(),
  //     antonyms: (json['antonyms'] as List?)?.cast<String>(),
  //     example: json['example'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'definition': definition,
  //     'synonyms': synonyms,
  //     'antonyms': antonyms,
  //     'example': example,
  //   };
  // }
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

  // factory Phonetic.fromJson(Map<String, dynamic> json) {
  //   return Phonetic(
  //     text: json['text'],
  //     audio: json['audio'],
  //     sourceUrl: json['sourceUrl'],
  //     license:
  //     json['license'] != null ? License.fromJson(json['license']) : null,
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'text': text,
  //     'audio': audio,
  //     'sourceUrl': sourceUrl,
  //     'license': license?.toJson(),
  //   };
  // }
}

class License {
  final String? name;
  final String? url;

  const License({
    this.name,
    this.url,
  });

  // factory License.fromJson(Map<String, dynamic> json) {
  //   return License(
  //     name: json['name'],
  //     url: json['url'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'url': url,
  //   };
  // }
}
import 'package:json_annotation/json_annotation.dart';

part 'dictionary_word_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DictionaryWordModel {
  final String? word;
  final String? phonetic;
  final List<PhoneticModel>? phonetics;
  final List<MeaningModel>? meanings;
  final LicenseModel? license;
  final List<String>? sourceUrls;

  const DictionaryWordModel({
   this.word,
   this.phonetic,
   this.phonetics,
   this.meanings,
   this.license,
   this.sourceUrls,
  });

  factory DictionaryWordModel.fromJson(Map<String, dynamic> json) => _$DictionaryWordModelFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryWordModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PhoneticModel {
  final String? text;
  final String? audio;
  final String? sourceUrl;
  final LicenseModel? license;

  const PhoneticModel({
    this.text,
    this.audio,
    this.sourceUrl,
    this.license,
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneticModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MeaningModel {
  final String? partOfSpeech;
  final List<DefinitionModel>? definitions;
  final List<String>? synonyms;
  final List<String>? antonyms;

  const MeaningModel({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningModelToJson(this);
}

@JsonSerializable()
class DefinitionModel {
  final String? definition;
  final List<String>? synonyms;
  final List<String>? antonyms;
  final String? example;

  const DefinitionModel({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionModelToJson(this);
}

@JsonSerializable()
class LicenseModel {
  final String? name;
  final String? url;

  const LicenseModel({
    this.name,
    this.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseModelToJson(this);
}
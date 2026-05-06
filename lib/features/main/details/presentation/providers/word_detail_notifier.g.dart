// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WordDetailNotifier)
final wordDetailProvider = WordDetailNotifierFamily._();

final class WordDetailNotifierProvider
    extends $AsyncNotifierProvider<WordDetailNotifier, WordDetailStates> {
  WordDetailNotifierProvider._({
    required WordDetailNotifierFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'wordDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wordDetailNotifierHash();

  @override
  String toString() {
    return r'wordDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  WordDetailNotifier create() => WordDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is WordDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wordDetailNotifierHash() =>
    r'924224a70ece544c0c19df0c518313103dd6c1af';

final class WordDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WordDetailNotifier,
          AsyncValue<WordDetailStates>,
          WordDetailStates,
          FutureOr<WordDetailStates>,
          (String, String)
        > {
  WordDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'wordDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WordDetailNotifierProvider call(String word, String initialPartOfSpeech) =>
      WordDetailNotifierProvider._(
        argument: (word, initialPartOfSpeech),
        from: this,
      );

  @override
  String toString() => r'wordDetailProvider';
}

abstract class _$WordDetailNotifier extends $AsyncNotifier<WordDetailStates> {
  late final _$args = ref.$arg as (String, String);
  String get word => _$args.$1;
  String get initialPartOfSpeech => _$args.$2;

  FutureOr<WordDetailStates> build(String word, String initialPartOfSpeech);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<WordDetailStates>, WordDetailStates>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WordDetailStates>, WordDetailStates>,
              AsyncValue<WordDetailStates>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

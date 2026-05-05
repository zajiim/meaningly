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
    extends $NotifierProvider<WordDetailNotifier, WordDetailStates> {
  WordDetailNotifierProvider._({
    required WordDetailNotifierFamily super.from,
    required String super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  WordDetailNotifier create() => WordDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WordDetailStates value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WordDetailStates>(value),
    );
  }

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
    r'94dfd0c2546b7dc8ebee544d691a256984330cba';

final class WordDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WordDetailNotifier,
          WordDetailStates,
          WordDetailStates,
          WordDetailStates,
          String
        > {
  WordDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'wordDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WordDetailNotifierProvider call(String initialPartOfSpeech) =>
      WordDetailNotifierProvider._(argument: initialPartOfSpeech, from: this);

  @override
  String toString() => r'wordDetailProvider';
}

abstract class _$WordDetailNotifier extends $Notifier<WordDetailStates> {
  late final _$args = ref.$arg as String;
  String get initialPartOfSpeech => _$args;

  WordDetailStates build(String initialPartOfSpeech);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WordDetailStates, WordDetailStates>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WordDetailStates, WordDetailStates>,
              WordDetailStates,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

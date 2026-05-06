// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookmarkNotifier)
final bookmarkProvider = BookmarkNotifierProvider._();

final class BookmarkNotifierProvider
    extends
        $AsyncNotifierProvider<BookmarkNotifier, List<DictionaryWordEntity>> {
  BookmarkNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkNotifierHash();

  @$internal
  @override
  BookmarkNotifier create() => BookmarkNotifier();
}

String _$bookmarkNotifierHash() => r'7d1d6b2ce23abce49dac7aaebe2af882726a1fb0';

abstract class _$BookmarkNotifier
    extends $AsyncNotifier<List<DictionaryWordEntity>> {
  FutureOr<List<DictionaryWordEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DictionaryWordEntity>>,
              List<DictionaryWordEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DictionaryWordEntity>>,
                List<DictionaryWordEntity>
              >,
              AsyncValue<List<DictionaryWordEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(isWordBookmarked)
final isWordBookmarkedProvider = IsWordBookmarkedFamily._();

final class IsWordBookmarkedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsWordBookmarkedProvider._({
    required IsWordBookmarkedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isWordBookmarkedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isWordBookmarkedHash();

  @override
  String toString() {
    return r'isWordBookmarkedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isWordBookmarked(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsWordBookmarkedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isWordBookmarkedHash() => r'9ad6010db6de5e7da7367814455be49037809721';

final class IsWordBookmarkedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  IsWordBookmarkedFamily._()
    : super(
        retry: null,
        name: r'isWordBookmarkedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsWordBookmarkedProvider call(String word) =>
      IsWordBookmarkedProvider._(argument: word, from: this);

  @override
  String toString() => r'isWordBookmarkedProvider';
}

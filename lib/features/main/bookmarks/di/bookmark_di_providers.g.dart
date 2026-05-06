// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarkDataSource)
final bookmarkDataSourceProvider = BookmarkDataSourceProvider._();

final class BookmarkDataSourceProvider
    extends
        $FunctionalProvider<
          BookmarkDataSource,
          BookmarkDataSource,
          BookmarkDataSource
        >
    with $Provider<BookmarkDataSource> {
  BookmarkDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkDataSourceHash();

  @$internal
  @override
  $ProviderElement<BookmarkDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookmarkDataSource create(Ref ref) {
    return bookmarkDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkDataSource>(value),
    );
  }
}

String _$bookmarkDataSourceHash() =>
    r'965dbd1ed680970b350ca7fc0457b25e945a0d55';

@ProviderFor(bookmarkRepository)
final bookmarkRepositoryProvider = BookmarkRepositoryProvider._();

final class BookmarkRepositoryProvider
    extends
        $FunctionalProvider<
          BookmarkRepository,
          BookmarkRepository,
          BookmarkRepository
        >
    with $Provider<BookmarkRepository> {
  BookmarkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookmarkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookmarkRepository create(Ref ref) {
    return bookmarkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkRepository>(value),
    );
  }
}

String _$bookmarkRepositoryHash() =>
    r'd40d3242d34bbc00ecd120553a340527a1a5a848';

import 'package:meaningly/core/database/database_service.dart';
import 'package:meaningly/features/main/bookmarks/data/data_sources/local/bookmark_data_source.dart';
import 'package:meaningly/features/main/bookmarks/data/repository/bookmark_repository_impl.dart';
import 'package:meaningly/features/main/bookmarks/domain/repository/bookmark_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_di_providers.g.dart';

@Riverpod(keepAlive: true)
BookmarkDataSource bookmarkDataSource(Ref ref) {
  final dbService = DatabaseService();
  return BookmarkDataSourceImpl(dbService);
}

@Riverpod(keepAlive: true)
BookmarkRepository bookmarkRepository(Ref ref) {
  final bookmarkDataSource = ref.watch(bookmarkDataSourceProvider);
  return BookmarkRepositoryImpl(bookmarkDataSource);
}


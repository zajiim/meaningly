import 'package:meaningly/features/main/bookmarks/di/bookmark_di_providers.dart';
import 'package:meaningly/features/main/search/domain/entities/dictionary_word_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_notifier.g.dart';

@riverpod
class BookmarkNotifier extends _$BookmarkNotifier{
  @override
  Future<List<DictionaryWordEntity>> build() async {
    final repository = ref.watch(bookmarkRepositoryProvider);
    final results = await repository.getBookMarks();

    return results.fold(
          (failure) => throw Exception(failure.message),
          (bookmarks) => bookmarks,
    );
  }

  Future<void> toggleBookmark(DictionaryWordEntity word) async {
    final repository = ref.read(bookmarkRepositoryProvider);
    final isAlreadyBookmarked = await repository.isBookMarked(word.word ?? '');

    await isAlreadyBookmarked.fold(
      (failure) => null,
      (isBookmarked) async {
        if(isBookmarked) {
          await repository.removeBookMark(word.word ?? '');
        } else {
          await repository.addBookMark(word);
        }
        ref.invalidateSelf();
      });
  }

  Future<bool> isBookmarked(String word) async {
    final repository = ref.read(bookmarkRepositoryProvider);
    final result = await repository.isBookMarked(word);
    return result.fold((_) => false, (isBookmarked) => isBookmarked);
  }
}

@riverpod
Future<bool> isWordBookmarked(Ref ref, String word) async {
  final bookmarks = await ref.watch(bookmarkProvider.future);
  return bookmarks.any((element) => element.word == word);
}

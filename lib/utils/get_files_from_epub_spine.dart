import 'package:epubz/epubz.dart';
import 'get_spine_items_from_epub.dart';

List<EpubContentFile> getFilesFromEpubSpine(EpubBook epubBook) {
  return getSpineItemsFromEpub(epubBook)
      .map((chapter) {
        if (epubBook.Content?.AllFiles?.containsKey(Uri.decodeFull(chapter.Href!)) != true) {
          return null;
        }

        return epubBook.Content!.AllFiles![Uri.decodeFull(chapter.Href!)]!;
      })
      .whereType<EpubTextContentFile>()
      .toList();
}

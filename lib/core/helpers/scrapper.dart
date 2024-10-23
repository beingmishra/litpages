import 'package:html/dom.dart';
import 'package:litpages/features/detail/models/book_detail_model.dart';
import 'package:litpages/features/home/models/book_listing_model.dart';

class ScrapeHelper {

  static List<BookListingModel> extractEditorChoice(Document document) {

    List<BookListingModel> books = [];

    final elements = document.querySelector(
        '.region-content .bs-region--top-center .block-region-top-center .block-views-blockbooks-block-editor-choice');

    if (elements != null) {
      // Loop through all found elements
      for (var data in elements.children) {

        // Find content items by class
        final contentItem = data.querySelector(".view-display-id-block_editor_choice");

        if (contentItem != null) {
          final bookItems = contentItem.querySelectorAll(".views-row .book .content");

          for (var book in bookItems) {
            final posterImage = book
                .querySelector(".field--name-field-cover .img-responsive")
                ?.attributes["src"];

            final bookName = book.querySelector(".field--name-field-title")?.text.trim();

            final bookId = book
                .querySelector(".field--name-field-title a")
                ?.attributes["href"]?.split("/").last;

            books.add(BookListingModel(id: bookId ?? "", title: bookName ?? "", poster: posterImage ?? ""));
          }
        }
      }
    }

    return books;
  }

  static List<BookListingModel> extractFreeBooks(Document document) {

    List<BookListingModel> books = [];

    final elements = document.querySelector(
        '.region-content .bs-region--top-main .block-views-blockblock-ebook-feature-homepage-todays-free-ebooks');

    if (elements != null) {
      // Loop through all found elements
      for (var data in elements.children) {

        // Find content items by class
        final contentItem =
        data.querySelector(".view-display-id-homepage_todays_free_ebooks");

        if (contentItem != null) {
          final bookItems = contentItem.querySelectorAll(
              ".views-row .deals-slider-item .layout__region--content");

          for (var book in bookItems) {
            final posterImage = book
                .querySelector(".field--name-field-ef-cover .img-responsive")
                ?.attributes["src"];

            final bookName = book
                .querySelector(
                ".block-field-blocknodeebook-featuretitle .block-content")
                ?.text
                .trim();

            final bookId = book
                .querySelector(".field--name-field-title a")
                ?.attributes["href"]?.split("/").last;

            books.add(BookListingModel(id: bookId ?? "", title: bookName ?? "", poster: posterImage ?? ""));

          }
        }
      }
    }

    return books;
  }

  static List<BookListingModel> extractTrendingBooks(
      Document document) {

    List<BookListingModel> books = [];

    final elements = document.querySelector(
        '.region-content .bs-region--top-center .block-region-top-center .block-views-blockbooks-block-trending-books');

    if (elements != null) {
      // Loop through all found elements
      for (var data in elements.children) {

        // Find content items by class
        final contentItem =
        data.querySelector(".view-display-id-block_trending_books");

        if (contentItem != null) {
          final bookItems = contentItem.querySelectorAll("li .book .content");

          for (var book in bookItems) {
            final posterImage = book
                .querySelector(".field--name-field-cover .img-responsive")
                ?.attributes["src"];

            final bookName =
            book.querySelector(".field--name-field-title")?.text.trim();

            final bookId = book
                .querySelector(".field--name-field-title a")
                ?.attributes["href"]?.split("/").last;

            books.add(BookListingModel(id: bookId ?? "", title: bookName ?? "", poster: posterImage ?? ""));
          }
        }
      }
    }

    return books;
  }

  static List<BookListingModel> extractPopularBooks(Document document) {

    List<BookListingModel> books = [];

    final elements = document.querySelector(
        '.region-content .bs-region--top-center .block-region-top-center .block-views-blockbooks-block-popular-classics');

    if (elements != null) {
      // Loop through all found elements
      for (var data in elements.children) {

        // Find content items by class
        final contentItem =
        data.querySelector(".view-display-id-block_popular_classics");

        if (contentItem != null) {
          final bookItems = contentItem.querySelectorAll("li .book .content");

          for (var book in bookItems) {
            final posterImage = book
                .querySelector(".field--name-field-cover .img-responsive")
                ?.attributes["src"];

            final bookName =
            book.querySelector(".field--name-field-title")?.text.trim();

            final bookId = book
                .querySelector(".field--name-field-title a")
                ?.attributes["href"]?.split("/").last;

            books.add(BookListingModel(id: bookId ?? "", title: bookName ?? "", poster: posterImage ?? ""));
          }
        }
      }
    }

    return books;
  }

  static BookDetailModel? extractBookDetails(Document document) {

    BookDetailModel? bookDetailModel;

    final elements = document.querySelector('.region-content .bs-region--top .container');

    if (elements != null) {
      // Loop through all found elements
      for (var data in elements.children) {
        var title = data.querySelector('.field--name-field-title')?.text;

        final bookId = data
            .querySelector(".field--name-field-title a")
            ?.attributes["href"]?.split("/").last;

        var author = data
            .querySelector('.field--name-field-author-er .field--item')
            ?.text
            .trim();

        var image = data
            .querySelector('.field--name-field-cover .img-responsive')
            ?.attributes["src"];

        var publishingYear =
            data.querySelector('.field--name-field-published-year')?.text;

        var pages = data.querySelector('.field--name-field-pages')?.text;

        var reads = data.querySelector('.field--name-field-downloads')?.text;

        var description =
            data.querySelector('.field--name-field-description')?.text;

        var genreQuery =
        data.querySelectorAll('.field--name-field-genre .field--item');

        List<String> genres = [];
        for (var genre in genreQuery) {
          if (genre.text.isNotEmpty) {
            genres.add(genre.text);
          }
        }

        bookDetailModel = BookDetailModel(id: bookId ?? "-", title: title ?? "-", poster: image ?? "-", author: author ?? "-", published: publishingYear ?? "-", reads: reads ?? "-", pages: pages ?? "-", description: description ?? "-", genre: genres);

        return bookDetailModel;
      }
    }

    return null;
  }


}
import 'package:litpages/features/home/models/book_listing_model.dart';

class DashboardModel {
  List<BookListingModel> deals;
  List<BookListingModel> editorChoice;
  List<BookListingModel> trending;
  List<BookListingModel> popular;

  DashboardModel(this.deals, this.editorChoice, this.trending, this.popular);
}
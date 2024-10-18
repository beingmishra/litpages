// To parse this JSON data, do
//
//     final bookListingModel = bookListingModelFromJson(jsonString);

import 'dart:convert';

List<BookListingModel> bookListingModelFromJson(String str) => List<BookListingModel>.from(json.decode(str).map((x) => BookListingModel.fromJson(x)));

String bookListingModelToJson(List<BookListingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookListingModel {
  String id;
  String title;
  String poster;

  BookListingModel({
    required this.id,
    required this.title,
    required this.poster,
  });

  factory BookListingModel.fromJson(Map<String, dynamic> json) => BookListingModel(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
  };
}

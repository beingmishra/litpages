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
  String? author;
  String? currentPrice;
  String? retailPrice;

  BookListingModel({
    required this.id,
    required this.title,
    required this.poster,
    this.author,
    this.currentPrice,
    this.retailPrice
  });

  factory BookListingModel.fromJson(Map<String, dynamic> json) => BookListingModel(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
    author: json["author"],
    currentPrice: json["currentPrice"],
    retailPrice: json["retailPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
    "author": author,
    "currentPrice": currentPrice,
    "retailPrice": retailPrice,
  };
}

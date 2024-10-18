// To parse this JSON data, do
//
//     final bookDetailModel = bookDetailModelFromJson(jsonString);

import 'dart:convert';

BookDetailModel bookDetailModelFromJson(String str) => BookDetailModel.fromJson(json.decode(str));

String bookDetailModelToJson(BookDetailModel data) => json.encode(data.toJson());

class BookDetailModel {
  String id;
  String title;
  String poster;
  String author;
  String published;
  String reads;
  String pages;
  String description;
  List<String> genre;

  BookDetailModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.author,
    required this.published,
    required this.reads,
    required this.pages,
    required this.description,
    required this.genre,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) => BookDetailModel(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
    author: json["author"],
    published: json["published"],
    reads: json["reads"],
    pages: json["pages"],
    description: json["description"],
    genre: List<String>.from(json["genre"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
    "author": author,
    "published": published,
    "reads": reads,
    "pages": pages,
    "description": description,
    "genre": List<dynamic>.from(genre.map((x) => x)),
  };
}

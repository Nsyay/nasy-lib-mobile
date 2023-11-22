// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

List<Book> bookFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
    String model;
    int pk;
    Fields fields;

    Book({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String author;
    int amount;
    String genre;
    String description;
    DateTime dateAdded;
    int user;

    Fields({
        required this.name,
        required this.author,
        required this.amount,
        required this.genre,
        required this.description,
        required this.dateAdded,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        author: json["author"],
        amount: json["amount"],
        genre: json["genre"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "amount": amount,
        "genre": genre,
        "description": description,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user,
    };
}

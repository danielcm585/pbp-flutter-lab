import 'dart:convert';

Watchlist watchlistFromJson(String str) => Watchlist.fromJson(json.decode(str));
String watchlistToJson(Watchlist data) => json.encode(data.toJson());

class Watchlist {
  Watchlist({
    this.pk,
    this.watched,
    this.title,
    this.rating,
    this.releaseDate,
    this.review,
  });

  int? pk;
  bool? watched;
  String? title;
  int? rating;
  DateTime? releaseDate;
  String? review;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
    pk: json['pk'],
    watched: json['fields']['watched'],
    title: json['fields']['title'],
    rating: json['fields']['rating'],
    releaseDate: DateTime.parse(json['fields']['release_date']),
    review: json['fields']['review'],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}
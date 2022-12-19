import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {

    int? count;
    String? next;
    dynamic previous;
    List<Pokemon>? results;

    Result({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Pokemon {
  
    String? name;
    String? url;

    Pokemon({
        this.name,
        this.url,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

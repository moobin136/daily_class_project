// To parse this JSON data, do
//
//     final comand = comandFromJson(jsonString);

import 'dart:convert';

List<Comand> comandFromJson(String str) => List<Comand>.from(json.decode(str).map((x) => Comand.fromJson(x)));

String comandToJson(List<Comand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comand {
    int postId;
    int id;
    String name;
    String email;
    String body;

    Comand({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory Comand.fromJson(Map<String, dynamic> json) => Comand(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}

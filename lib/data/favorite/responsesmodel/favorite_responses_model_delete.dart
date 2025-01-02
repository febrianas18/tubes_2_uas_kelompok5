// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final String message;

  Welcome({
    required this.message,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
//
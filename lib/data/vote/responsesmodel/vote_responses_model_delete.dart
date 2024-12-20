// To parse this JSON data, do
//
//     final voteResponsesModelDelete = voteResponsesModelDeleteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VoteResponsesModelDelete voteResponsesModelDeleteFromJson(String str) => VoteResponsesModelDelete.fromJson(json.decode(str));

String voteResponsesModelDeleteToJson(VoteResponsesModelDelete data) => json.encode(data.toJson());

class VoteResponsesModelDelete {
    final String message;

    VoteResponsesModelDelete({
        required this.message,
    });

    factory VoteResponsesModelDelete.fromJson(Map<String, dynamic> json) => VoteResponsesModelDelete(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}

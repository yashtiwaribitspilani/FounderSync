// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Experiences {
  Experiences({
    required this.startsAt,
    required this.endsAt,
    required this.company,
    required this.companyLinkedinProfileUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.logoUrl,
  });

  final SAt? startsAt;
  final SAt? endsAt;
  final String company;
  final String companyLinkedinProfileUrl;
  final String title;
  final String description;
  final String location;
  final String logoUrl;

  factory Experiences.fromJson(Map<String, dynamic> json) {
    return Experiences(
      startsAt:
          json["starts_at"] == null ? null : SAt.fromJson(json["starts_at"]),
      endsAt: json["ends_at"] == null ? null : SAt.fromJson(json["ends_at"]),
      company: json["company"] ?? "",
      companyLinkedinProfileUrl: json["company_linkedin_profile_url"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      location: json["location"] ?? "",
      logoUrl: json["logo_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "starts_at": startsAt?.toJson(),
        "ends_at": endsAt?.toJson(),
        "company": company,
        "company_linkedin_profile_url": companyLinkedinProfileUrl,
        "title": title,
        "description": description,
        "location": location,
        "logo_url": logoUrl,
      };
}

class SAt {
  SAt({
    required this.day,
    required this.month,
    required this.year,
  });

  final int day;
  final int month;
  final int year;

  factory SAt.fromJson(Map<String, dynamic> json) {
    return SAt(
      day: json["day"] ?? 0,
      month: json["month"] ?? 0,
      year: json["year"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

DateTime? enddate(dynamic? linkedinjson) {
  if (linkedinjson == null) {
    return null;
  }
  Experiences experiences = Experiences.fromJson(linkedinjson);
  if (experiences.endsAt == null) {
    return null;
  }
  return DateTime(experiences.endsAt!.year, experiences.endsAt!.month,
      experiences.endsAt!.day);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

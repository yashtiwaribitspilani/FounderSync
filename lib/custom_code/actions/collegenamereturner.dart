// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Education {
  Education({
    required this.startsAt,
    required this.endsAt,
    required this.fieldOfStudy,
    required this.degreeName,
    required this.school,
    required this.schoolLinkedinProfileUrl,
    required this.description,
    required this.logoUrl,
    required this.grade,
    required this.activitiesAndSocieties,
  });

  final SAt? startsAt;
  final SAt? endsAt;
  final String fieldOfStudy;
  final String degreeName;
  final String school;
  final dynamic schoolLinkedinProfileUrl;
  final dynamic description;
  final String logoUrl;
  final String grade;
  final dynamic activitiesAndSocieties;

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      startsAt:
          json["starts_at"] == null ? null : SAt.fromJson(json["starts_at"]),
      endsAt: json["ends_at"] == null ? null : SAt.fromJson(json["ends_at"]),
      fieldOfStudy: json["field_of_study"] ?? "",
      degreeName: json["degree_name"] ?? "",
      school: json["school"] ?? "",
      schoolLinkedinProfileUrl: json["school_linkedin_profile_url"],
      description: json["description"],
      logoUrl: json["logo_url"] ?? "",
      grade: json["grade"] ?? "",
      activitiesAndSocieties: json["activities_and_societies"],
    );
  }

  Map<String, dynamic> toJson() => {
        "starts_at": startsAt?.toJson(),
        "ends_at": endsAt?.toJson(),
        "field_of_study": fieldOfStudy,
        "degree_name": degreeName,
        "school": school,
        "school_linkedin_profile_url": schoolLinkedinProfileUrl,
        "description": description,
        "logo_url": logoUrl,
        "grade": grade,
        "activities_and_societies": activitiesAndSocieties,
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

String? collegenamereturner(dynamic? linkedinjson) {
  if (linkedinjson == null) {
    return null;
  }
  Education education = Education.fromJson(linkedinjson);
  return education.school;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

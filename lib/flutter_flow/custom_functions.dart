import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? generateChatId(
  String id1,
  String id2,
) {
  List<String> array = [id1, id2];
  array.sort();
  String finalString = 'chats/${array[0]}-${array[1]}';
  //print(finalString);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return firestore.doc(finalString);
}

DocumentReference newCustomFunction(String uid) {
  return uid as DocumentReference;
}

String? dateReturn(
  DateTime? date1,
  DateTime? date2,
) {
  // dart function to return String in year and months in dart
  if (date1 == null || date2 == null) {
    return null;
  }

  int months = date2.month - date1.month + 12 * (date2.year - date1.year);
  int years = months ~/ 12;
  months = months % 12;

  if (years == 0) {
    return '$months months';
  } else if (months == 0) {
    return '$years years';
  } else {
    return '$years years, $months months';
  }
}

String textreturner(
  bool collapsed,
  String text,
) {
  if (collapsed && text.length > 140) {
    String newString = text.substring(0, 140);
    return newString + "...";
  } else {
    return text;
  }
}

String showmoreless(
  bool collapsed,
  String text,
) {
  if (collapsed && text.length > 140) {
    return "show more";
  }
  if (!collapsed && text.length > 140) {
    return "show less";
  } else {
    return "";
  }
}

List<String> combineLists(
  List<String>? likes,
  List<String>? rejected,
) {
  final List<String> newList = <String>[""];
  if (likes != null) {
    likes.forEach((match) => newList.add(match));
  }
  if (rejected != null) {
    rejected.forEach((reject) => newList.add(reject));
  }
  return newList;
}

bool emptyRequest(
  String choice,
  List<String>? like,
) {
  if (choice == "Requests sent" && like?.isEmpty == true) {
    return true;
  } else {
    return false;
  }
}

List<UsersRecord>? filterlikelist(
  List<UsersRecord>? userlist,
  List<String>? like,
) {
  // function to filter user document firebase by matching uid with list of string containing uids
  if (userlist == null || userlist.isEmpty) {
    return null;
  }

  if (like == null) {
    return null;
  }

  final filteredList = <UsersRecord>[];

  for (final user in userlist) {
    if ((like.contains(user.uid))) {
      filteredList.add(user);
    }
  }

  return filteredList;
}

bool requestSentList(
  List<String>? like,
  String choice,
) {
  if (like?.isEmpty == false && choice == "Requests sent") {
    return true;
  } else {
    return false;
  }
}

List<UsersRecord>? filterlist(
  List<UsersRecord>? userlist,
  List<String>? like,
  List<String>? reject,
  String? rolefilter,
  bool? nearme,
  String? usercity,
  String? userstate,
  String? lookingforfilter,
) {
  // function to filter user document firebase by matching uid with list of string containing uids
  if (userlist == null || userlist.isEmpty) {
    return null;
  }

  if (like == null && reject == null) {
    return userlist;
  }

  final filteredList = <UsersRecord>[];

  for (final user in userlist) {
    if (like != null &&
        !(like.contains(user.uid)) &&
        reject != null &&
        !(reject.contains(user.uid))) {
      filteredList.add(user);
    }
  }
  filteredList.removeWhere((element) => element.displayName.isEmpty);
  if (rolefilter != null && rolefilter.isNotEmpty && rolefilter != "All") {
    filteredList.removeWhere((el) => el.role != rolefilter);
  }
  if (lookingforfilter != null &&
      lookingforfilter.isNotEmpty &&
      lookingforfilter != "All") {
    filteredList.removeWhere((el) => el.lookingfor != lookingforfilter);
  }
  if (nearme == null || usercity == null || userstate == null) {
    return filteredList;
  }
  if (nearme == false) {
    return filteredList;
  }
  if (nearme == true) {
    List<UsersRecord> filteredListBeforecity = filteredList.toList();
    filteredList.removeWhere((element) => element.city != usercity);
    if (filteredList.isEmpty) {
      List<UsersRecord> filteredListBeforestate =
          filteredListBeforecity.toList();
      filteredListBeforecity
          .removeWhere((element) => element.state != userstate);
      if (filteredListBeforecity.isEmpty) {
        return filteredListBeforestate;
      } else {
        return filteredListBeforecity;
      }
    } else {
      return filteredList;
    }
  }
  return filteredList;
}

dynamic createjson(String merchantsubid) {
  return {
    "merchantId": "PGTESTPAYUAT",
    "merchantSubscriptionId": merchantsubid,
    "merchantUserId": "TAMASHATVONLINE",
    "authWorkflowType": "TRANSACTION",
    "amountType": "FIXED",
    "amount": 29900,
    "frequency": "MONTHLY",
    "recurringCount": 12,
    "mobileNumber": "7651867493",
    "deviceContext": {
      "phonePeVersionCode": 400895 //Only for ANDROID
    }
  };
}

String convertjsontobase64(dynamic json) {
  String jsonString = jsonEncode(json);
  String base64String = base64.encode(utf8.encode(jsonString));
  return base64String;
}

dynamic createjsonauth(
  String subid,
  String authrequestid,
) {
  return {
    "merchantId": "PGTESTPAYUAT",
    "merchantUserId": "TAMASHATVONLINE",
    "subscriptionId": subid,
    "authRequestId": authrequestid,
    "amount": 29900,
    "paymentInstrument": {"type": "UPI_INTENT", "targetApp": "com.phonepe.app"},
    "deviceContext": {"deviceOS": "ANDROID"}
  };
}

List<StartupRecord>? startupfilterlist(
  List<DocumentReference>? liked,
  List<DocumentReference>? rejected,
  List<StartupRecord>? ideas,
  String? industrytypefilter,
  String? lookingforfilter,
) {
  // function to filter ideas document firebase by matching uid with list of string containing uids
  if (liked == null && rejected == null) {
    return ideas;
  }

  final filteredIdeas = <StartupRecord>[];
  for (final idea in ideas!) {
    if (liked != null &&
        !(liked.contains(idea.reference)) &&
        rejected != null &&
        !(rejected.contains(idea.reference))) {
      filteredIdeas.add(idea);
    }
  }
  if (industrytypefilter != 'All' &&
      industrytypefilter != null &&
      industrytypefilter.isNotEmpty) {
    filteredIdeas.removeWhere((el) => el.industrytyoe != industrytypefilter);
  }
  if (lookingforfilter != "All" &&
      lookingforfilter != null &&
      lookingforfilter.isNotEmpty) {
    filteredIdeas
        .removeWhere((el) => !(el.lookingfor.contains(lookingforfilter)));
  }
  return filteredIdeas;
}

String requeststatus(
  List<String>? requestlist,
  List<String>? teamuplist,
  List<String>? rejectedlist,
  String? uid,
) {
  // dart function to check if uid is present in all three list
  if (requestlist?.contains(uid) == true) {
    return 'pending';
  } else if (teamuplist?.contains(uid) == true) {
    return 'accepted';
  } else if (rejectedlist?.contains(uid) == true) {
    return 'rejected';
  } else {
    return 'not_requested';
  }
}

String textreturnerCopy(
  bool collapsed,
  String text,
) {
  if (collapsed && text.length > 20) {
    String newString = text.substring(0, 20);
    return newString + "...";
  } else {
    return text;
  }
}

bool subscriberlist(
  List<DocumentReference>? list,
  DocumentReference uid,
) {
  if (list?.contains(uid) == true) {
    return true;
  } else {
    return false;
  }
}

double newCustomFunction2(
  int ratingssum,
  int reviews,
) {
  return ratingssum / reviews;
}

double newsum(
  double sumrating,
  double currentrating,
) {
  return sumrating + currentrating;
}

double averagerating(
  double sumrating,
  double noofrating,
) {
  if (sumrating == 0 || noofrating == 0) {
    return 0.0;
  }
  return sumrating / noofrating;
}

double averagecallback(
  double sumrating,
  double noofrating,
  double newrating,
) {
  double rating = (sumrating + newrating) / (noofrating + 1);
  return rating;
}

List<IdeaRecord>? ideafilter(
  List<DocumentReference>? liked,
  List<DocumentReference>? rejected,
  List<IdeaRecord>? ideas,
) {
  // function to filter ideas document firebase by matching uid with list of string containing uids
  if (liked == null && rejected == null) {
    return ideas;
  }

  final filteredIdeas = <IdeaRecord>[];
  for (final idea in ideas!) {
    if (liked != null &&
        !(liked.contains(idea.reference)) &&
        rejected != null &&
        !(rejected.contains(idea.reference))) {
      filteredIdeas.add(idea);
    }
  }

  return filteredIdeas;
}

int remainder(int noofswipes) {
  // dart function to return remainder when divided by 3
  return noofswipes % 3;
}

int noofunseen(List<WeLikeEachOtherRecord>? listdoc) {
  if (listdoc == null) {
    return 0;
  }
  int unseen = 0;
  for (final listitem in listdoc) {
    unseen = unseen + listitem.unseen;
  }
  return unseen;
}

List<IdeaRecord>? myideafollowinglist(
  List<IdeaRecord>? idealist,
  List<DocumentReference>? followinglist,
) {
  if (idealist == null || followinglist == null) {
    return null;
  }
  idealist.removeWhere((element) => !followinglist.contains(element.reference));
  return idealist;
}

bool newideanotif(List<IdeaRecord>? ideadoc) {
  if (ideadoc == null) {
    return false;
  }
  bool updates = false;
  for (final idea in ideadoc) {
    if (idea.newupdates == true) {
      updates = true;
    }
  }
  return updates;
}

String sharestartupfromswipe(
  String userwhoshared,
  String startupname,
  String startupreference,
) {
  String newlink =
      "https://foundersync.co/startUpdisplaypage?startupdoc=${startupreference}";
  String newurl = '''Hey whatsup! 
  ${userwhoshared}, has requested you to review the idea ${startupname}. Here is the link to it
  ${newlink}
      ''';
  return newurl;
}

String sharelink(
  String link,
  String userwhoshared,
  String venturename,
  String venturetype,
) {
  String newlink = link.replaceAll(
      "foundersync://foundersync.com", "https://foundersync.co");
  String newurl = "";
  if (venturetype == "idea") {
    newurl = '''Hey whatsup! 
         ${userwhoshared}, has requested you to review the idea ${venturename}. Here is the link to it
         ${newlink}
      ''';
  } else {
    newurl = '''Hey whatsup! 
         ${userwhoshared}, has requested you to review the start-up ${venturename}. Here is the link to it
         ${newlink}
      ''';
  }

  return newurl;
}

double? progresspercent(
  String? name,
  String? description,
  String? state,
  String? city,
  String? lookingfor,
  String? potential,
  String? profilepic,
) {
  double percentComplete = 0.0;
  if (!(name == null || name.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(description == null || description.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(state == null || state.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(city == null || city.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(lookingfor == null || lookingfor.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(potential == null || potential.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }
  if (!(profilepic == null || profilepic.isEmpty)) {
    percentComplete = percentComplete + 1 / 7;
  }

  return percentComplete;
}

DateTime? datetime(
  int? day,
  int? month,
  int? year,
) {
  // dart function which takes day,month and year and converts it to DateTime
  if (day == null || month == null || year == null) {
    return null;
  }
  return DateTime(year, month, day);
}

Color backgroundcolourforpopup(bool ispopupopen) {
  if (ispopupopen) {
    return Color(0xFFE0E3E7);
  } else {
    return Color(0xFFF1F4F8);
  }
}

int wordcounter(String text) {
  return text.length;
}

bool ispresentincontactlist(
  List<DocumentReference>? contactlist,
  DocumentReference? currentcontact,
) {
  if (currentcontact == null || contactlist == null || contactlist.isEmpty) {
    return false;
  }
  return contactlist.contains(currentcontact);
}

String shareideafromswipe(
  String userwhoshared,
  String ideaname,
  String ideareference,
) {
  String newlink =
      "https://foundersync.co/ideadisplaypage?ideadoc=${ideareference}";
  String newurl = '''Hey whatsup! 
  ${userwhoshared}, has requested you to review the idea ${ideaname}. Here is the link to it
  ${newlink}
      ''';
  return newurl;
}

int? topercentageprofile(double? value) {
  // dart function which returns given decimal value in int after multiplying by 100 and taking ceiling
  if (value == null) {
    return null;
  }
  return (value * 100).ceil();
}

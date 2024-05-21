// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "package:crypto/crypto.dart";
import "dart:convert";

Future<String> sha256authstatus(String merchantId, String authRequestId) async {
  String data = "/v3/recurring/auth/status/$merchantId/$authRequestId" +
      "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";

  List<int> bytes = utf8.encode(data);
  Digest digest = await sha256.convert(bytes);
  String hash = digest.toString();
  return hash + "###1";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
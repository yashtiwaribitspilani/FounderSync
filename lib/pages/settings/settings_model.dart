import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  String merchantsubid = 'id';

  String authuserid = 'authid';

  String xverifystatus = 'x-verify';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - sha256new] action in Button widget.
  String? xverify;
  // Stores action output result for [Backend Call - API (subscription)] action in Button widget.
  ApiCallResponse? usersubscription;
  // Stores action output result for [Custom Action - sha256auth] action in Button widget.
  String? xverifyauth;
  // Stores action output result for [Backend Call - API (submitauthrequestapi)] action in Button widget.
  ApiCallResponse? apiResult349;
  // Stores action output result for [Custom Action - sha256authstatus] action in Button widget.
  String? xverifyauthrequest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'step1_widget.dart' show Step1Widget;
import 'package:flutter/material.dart';

class Step1Model extends FlutterFlowModel<Step1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for role widget.
  FormFieldController<List<String>>? roleValueController;
  String? get roleValue => roleValueController?.value?.firstOrNull;
  set roleValue(String? val) =>
      roleValueController?.value = val != null ? [val] : [];
  // State field(s) for lookingfor widget.
  FormFieldController<List<String>>? lookingforValueController;
  String? get lookingforValue => lookingforValueController?.value?.firstOrNull;
  set lookingforValue(String? val) =>
      lookingforValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

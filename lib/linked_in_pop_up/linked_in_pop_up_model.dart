import '/flutter_flow/flutter_flow_util.dart';
import 'linked_in_pop_up_widget.dart' show LinkedInPopUpWidget;
import 'package:flutter/material.dart';

class LinkedInPopUpModel extends FlutterFlowModel<LinkedInPopUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

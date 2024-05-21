import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for potential widget.
  FormFieldController<List<String>>? potentialValueController;
  String? get potentialValue => potentialValueController?.value?.firstOrNull;
  set potentialValue(String? val) =>
      potentialValueController?.value = val != null ? [val] : [];
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

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'onetime_name_widget.dart' show OnetimeNameWidget;
import 'package:flutter/material.dart';

class OnetimeNameModel extends FlutterFlowModel<OnetimeNameWidget> {
  ///  Local state fields for this page.

  List<String> state = [];
  void addToState(String item) => state.add(item);
  void removeFromState(String item) => state.remove(item);
  void removeAtIndexFromState(int index) => state.removeAt(index);
  void insertAtIndexInState(int index, String item) =>
      state.insert(index, item);
  void updateStateAtIndex(int index, Function(String) updateFn) =>
      state[index] = updateFn(state[index]);

  bool isloaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (statesapi)] action in onetime_name widget.
  ApiCallResponse? apiResulty5r;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}

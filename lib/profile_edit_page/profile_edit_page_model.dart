import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_edit_page_widget.dart' show ProfileEditPageWidget;
import 'package:flutter/material.dart';

class ProfileEditPageModel extends FlutterFlowModel<ProfileEditPageWidget> {
  ///  Local state fields for this page.

  bool isloadingstate = false;

  bool isloadingcity = false;

  List<String> state = [];
  void addToState(String item) => state.add(item);
  void removeFromState(String item) => state.remove(item);
  void removeAtIndexFromState(int index) => state.removeAt(index);
  void insertAtIndexInState(int index, String item) =>
      state.insert(index, item);
  void updateStateAtIndex(int index, Function(String) updateFn) =>
      state[index] = updateFn(state[index]);

  List<String> city = [];
  void addToCity(String item) => city.add(item);
  void removeFromCity(String item) => city.remove(item);
  void removeAtIndexFromCity(int index) => city.removeAt(index);
  void insertAtIndexInCity(int index, String item) => city.insert(index, item);
  void updateCityAtIndex(int index, Function(String) updateFn) =>
      city[index] = updateFn(city[index]);

  String selectedState = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (statesapi)] action in profileEditPage widget.
  ApiCallResponse? apiResulty5rr;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // Stores action output result for [Backend Call - API (citiesapi)] action in state widget.
  ApiCallResponse? apiResultod4;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for lookingfor widget.
  FormFieldController<List<String>>? lookingforValueController;
  String? get lookingforValue => lookingforValueController?.value?.firstOrNull;
  set lookingforValue(String? val) =>
      lookingforValueController?.value = val != null ? [val] : [];
  // State field(s) for role widget.
  FormFieldController<List<String>>? roleValueController;
  String? get roleValue => roleValueController?.value?.firstOrNull;
  set roleValue(String? val) =>
      roleValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}

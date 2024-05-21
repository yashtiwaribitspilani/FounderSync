import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'postanidea2_copy_widget.dart' show Postanidea2CopyWidget;
import 'package:flutter/material.dart';

class Postanidea2CopyModel extends FlutterFlowModel<Postanidea2CopyWidget> {
  ///  Local state fields for this page.

  List<String> competition = [];
  void addToCompetition(String item) => competition.add(item);
  void removeFromCompetition(String item) => competition.remove(item);
  void removeAtIndexFromCompetition(int index) => competition.removeAt(index);
  void insertAtIndexInCompetition(int index, String item) =>
      competition.insert(index, item);
  void updateCompetitionAtIndex(int index, Function(String) updateFn) =>
      competition[index] = updateFn(competition[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for solution widget.
  FocusNode? solutionFocusNode1;
  TextEditingController? solutionTextController1;
  String? Function(BuildContext, String?)? solutionTextController1Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for solution widget.
  FocusNode? solutionFocusNode2;
  TextEditingController? solutionTextController2;
  String? Function(BuildContext, String?)? solutionTextController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    solutionFocusNode1?.dispose();
    solutionTextController1?.dispose();

    solutionFocusNode2?.dispose();
    solutionTextController2?.dispose();
  }
}

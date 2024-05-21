import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'people_undopage_widget.dart' show PeopleUndopageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class PeopleUndopageModel extends FlutterFlowModel<PeopleUndopageWidget> {
  ///  Local state fields for this page.

  bool collapsed = true;

  int? toursteps = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwipeableStackundopage widget.
  late CardSwiperController swipeableStackundopageController;
  // Stores action output result for [Backend Call - API (likepost)] action in SwipeableStackundopage widget.
  ApiCallResponse? apiResult0wb1;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    swipeableStackundopageController = CardSwiperController();
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBar1Model.dispose();
  }
}

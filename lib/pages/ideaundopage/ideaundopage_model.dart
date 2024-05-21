import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ideaundopage_widget.dart' show IdeaundopageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class IdeaundopageModel extends FlutterFlowModel<IdeaundopageWidget> {
  ///  Local state fields for this page.

  bool collapsed = true;

  double fkaevalue = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwipeableStack2 widget.
  late CardSwiperController swipeableStack2Controller;

  @override
  void initState(BuildContext context) {
    swipeableStack2Controller = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

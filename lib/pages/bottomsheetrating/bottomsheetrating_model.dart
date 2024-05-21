import '/flutter_flow/flutter_flow_util.dart';
import 'bottomsheetrating_widget.dart' show BottomsheetratingWidget;
import 'package:flutter/material.dart';

class BottomsheetratingModel extends FlutterFlowModel<BottomsheetratingWidget> {
  ///  Local state fields for this component.

  int avrating = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

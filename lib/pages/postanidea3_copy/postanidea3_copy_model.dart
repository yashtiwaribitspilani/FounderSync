import '/flutter_flow/flutter_flow_util.dart';
import 'postanidea3_copy_widget.dart' show Postanidea3CopyWidget;
import 'package:flutter/material.dart';

class Postanidea3CopyModel extends FlutterFlowModel<Postanidea3CopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for makingproduction widget.
  FocusNode? makingproductionFocusNode;
  TextEditingController? makingproductionTextController;
  String? Function(BuildContext, String?)?
      makingproductionTextControllerValidator;
  // State field(s) for delivery widget.
  FocusNode? deliveryFocusNode;
  TextEditingController? deliveryTextController;
  String? Function(BuildContext, String?)? deliveryTextControllerValidator;
  // State field(s) for sale widget.
  FocusNode? saleFocusNode;
  TextEditingController? saleTextController;
  String? Function(BuildContext, String?)? saleTextControllerValidator;
  // State field(s) for profitunit widget.
  FocusNode? profitunitFocusNode;
  TextEditingController? profitunitTextController;
  String? Function(BuildContext, String?)? profitunitTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    makingproductionFocusNode?.dispose();
    makingproductionTextController?.dispose();

    deliveryFocusNode?.dispose();
    deliveryTextController?.dispose();

    saleFocusNode?.dispose();
    saleTextController?.dispose();

    profitunitFocusNode?.dispose();
    profitunitTextController?.dispose();
  }
}

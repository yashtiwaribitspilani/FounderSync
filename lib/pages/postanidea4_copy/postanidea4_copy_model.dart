import '/components/timelineend_widget.dart';
import '/components/timelinestart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'postanidea4_copy_widget.dart' show Postanidea4CopyWidget;
import 'package:flutter/material.dart';

class Postanidea4CopyModel extends FlutterFlowModel<Postanidea4CopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for timelinestart component.
  late TimelinestartModel timelinestartModel;
  // Model for timelineend component.
  late TimelineendModel timelineendModel;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    timelinestartModel = createModel(context, () => TimelinestartModel());
    timelineendModel = createModel(context, () => TimelineendModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    timelinestartModel.dispose();
    timelineendModel.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}

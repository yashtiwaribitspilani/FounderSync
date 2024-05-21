import '/components/timelineend_widget.dart';
import '/components/timelinestart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'postanidea4_widget.dart' show Postanidea4Widget;
import 'package:flutter/material.dart';

class Postanidea4Model extends FlutterFlowModel<Postanidea4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  // Model for timelinestart component.
  late TimelinestartModel timelinestartModel;
  // Model for timelineend component.
  late TimelineendModel timelineendModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    timelinestartModel = createModel(context, () => TimelinestartModel());
    timelineendModel = createModel(context, () => TimelineendModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();

    timelinestartModel.dispose();
    timelineendModel.dispose();
  }
}

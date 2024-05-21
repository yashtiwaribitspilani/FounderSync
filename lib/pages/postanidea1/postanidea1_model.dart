import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'postanidea1_widget.dart' show Postanidea1Widget;
import 'package:flutter/material.dart';

class Postanidea1Model extends FlutterFlowModel<Postanidea1Widget> {
  ///  Local state fields for this page.

  String text = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ideaname widget.
  FocusNode? ideanameFocusNode;
  TextEditingController? ideanameTextController;
  String? Function(BuildContext, String?)? ideanameTextControllerValidator;
  // State field(s) for Problem widget.
  FocusNode? problemFocusNode;
  TextEditingController? problemTextController;
  String? Function(BuildContext, String?)? problemTextControllerValidator;
  // State field(s) for industry widget.
  String? industryValue;
  FormFieldController<String>? industryValueController;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  IdeaRecord? ideaid;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    ideanameFocusNode?.dispose();
    ideanameTextController?.dispose();

    problemFocusNode?.dispose();
    problemTextController?.dispose();
  }
}

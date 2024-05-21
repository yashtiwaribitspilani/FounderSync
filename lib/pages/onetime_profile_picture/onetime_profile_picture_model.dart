import '/flutter_flow/flutter_flow_util.dart';
import 'onetime_profile_picture_widget.dart' show OnetimeProfilePictureWidget;
import 'package:flutter/material.dart';

class OnetimeProfilePictureModel
    extends FlutterFlowModel<OnetimeProfilePictureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

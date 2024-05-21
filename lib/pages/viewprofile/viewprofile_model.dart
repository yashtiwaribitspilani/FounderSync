import '/components/tabbarswipe_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'viewprofile_widget.dart' show ViewprofileWidget;
import 'package:flutter/material.dart';

class ViewprofileModel extends FlutterFlowModel<ViewprofileWidget> {
  ///  Local state fields for this page.

  bool collapsed = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Tabbarswipe component.
  late TabbarswipeModel tabbarswipeModel;

  @override
  void initState(BuildContext context) {
    tabbarswipeModel = createModel(context, () => TabbarswipeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabbarswipeModel.dispose();
  }
}

import '/components/editable_tabbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile12_widget.dart' show Profile12Widget;
import 'package:flutter/material.dart';

class Profile12Model extends FlutterFlowModel<Profile12Widget> {
  ///  Local state fields for this page.

  bool collapsed = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for editableTabbar component.
  late EditableTabbarModel editableTabbarModel;

  @override
  void initState(BuildContext context) {
    editableTabbarModel = createModel(context, () => EditableTabbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editableTabbarModel.dispose();
  }
}

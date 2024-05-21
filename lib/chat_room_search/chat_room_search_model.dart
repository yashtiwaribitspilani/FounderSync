import '/components/chat_search_component_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_room_search_widget.dart' show ChatRoomSearchWidget;
import 'package:flutter/material.dart';

class ChatRoomSearchModel extends FlutterFlowModel<ChatRoomSearchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for chatSearchComponent dynamic component.
  late FlutterFlowDynamicModels<ChatSearchComponentModel>
      chatSearchComponentModels;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    chatSearchComponentModels =
        FlutterFlowDynamicModels(() => ChatSearchComponentModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    chatSearchComponentModels.dispose();
    navBar1Model.dispose();
  }
}

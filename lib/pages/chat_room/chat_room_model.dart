import '/components/chat_user_item_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_room_widget.dart' show ChatRoomWidget;
import 'package:flutter/material.dart';

class ChatRoomModel extends FlutterFlowModel<ChatRoomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for chatUserItem dynamic component.
  late FlutterFlowDynamicModels<ChatUserItemModel> chatUserItemModels;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    chatUserItemModels = FlutterFlowDynamicModels(() => ChatUserItemModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatUserItemModels.dispose();
    navBar1Model.dispose();
  }
}

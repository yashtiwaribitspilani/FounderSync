import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_user_item_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nochat/nochat_widget.dart';
import 'package:flutter/material.dart';
import 'chat_room_model.dart';
export 'chat_room_model.dart';

class ChatRoomWidget extends StatefulWidget {
  const ChatRoomWidget({super.key});

  @override
  State<ChatRoomWidget> createState() => _ChatRoomWidgetState();
}

class _ChatRoomWidgetState extends State<ChatRoomWidget> {
  late ChatRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatRoomModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatRoom'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'chatRoom',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Chat',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 90.0),
                    child: StreamBuilder<List<WeLikeEachOtherRecord>>(
                      stream: queryWeLikeEachOtherRecord(
                        parent: currentUserReference,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF0077B5),
                                ),
                              ),
                            ),
                          );
                        }
                        List<WeLikeEachOtherRecord>
                            listViewWeLikeEachOtherRecordList = snapshot.data!;
                        if (listViewWeLikeEachOtherRecordList.isEmpty) {
                          return const NochatWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewWeLikeEachOtherRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewWeLikeEachOtherRecord =
                                listViewWeLikeEachOtherRecordList[
                                    listViewIndex];
                            return wrapWithModel(
                              model: _model.chatUserItemModels.getModel(
                                listViewWeLikeEachOtherRecord.uid,
                                listViewIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: ChatUserItemWidget(
                                key: Key(
                                  'Key47w_${listViewWeLikeEachOtherRecord.uid}',
                                ),
                                documentReference: listViewWeLikeEachOtherRecord
                                    .documentReference!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 90.0,
                      decoration: const BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Stack(
                        children: [
                          wrapWithModel(
                            model: _model.navBar1Model,
                            updateCallback: () => setState(() {}),
                            child: const NavBar1Widget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

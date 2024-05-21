import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/chatitem_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat_conversation_model.dart';
export 'chat_conversation_model.dart';

class ChatConversationWidget extends StatefulWidget {
  const ChatConversationWidget({
    super.key,
    required this.name,
    required this.id2,
    required this.user2,
    String? userImage,
    required this.user2doc,
    this.welikedocvieweruser,
  }) : userImage = userImage ??
            'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?w=740&t=st=1706095465~exp=1706096065~hmac=ed4fab7d0000102c500401a815562f2859a479abf57fa773a0ec86e702c67ba3';

  final String? name;
  final String? id2;
  final DocumentReference? user2;
  final String userImage;
  final UsersRecord? user2doc;
  final WeLikeEachOtherRecord? welikedocvieweruser;

  @override
  State<ChatConversationWidget> createState() => _ChatConversationWidgetState();
}

class _ChatConversationWidgetState extends State<ChatConversationWidget> {
  late ChatConversationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatConversationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chatConversation'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_CONVERSATION_chatConversation_ON_IN');
      logFirebaseEvent('chatConversation_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('chatConversation_backend_call');

      await widget.welikedocvieweruser!.reference
          .update(createWeLikeEachOtherRecordData(
        unseen: 0,
      ));
      logFirebaseEvent('chatConversation_scroll_to');
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        logFirebaseEvent('CHAT_CONVERSATION_TextField_g1d3str7_ON_');
        logFirebaseEvent('TextField_scroll_to');
        await _model.listViewController?.animateTo(
          _model.listViewController!.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WeLikeEachOtherRecord>>(
      stream: queryWeLikeEachOtherRecord(
        parent: currentUserReference,
        queryBuilder: (weLikeEachOtherRecord) => weLikeEachOtherRecord.where(
          'uid',
          isEqualTo: widget.id2,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF0077B5),
                  ),
                ),
              ),
            ),
          );
        }
        List<WeLikeEachOtherRecord> chatConversationWeLikeEachOtherRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final chatConversationWeLikeEachOtherRecord =
            chatConversationWeLikeEachOtherRecordList.isNotEmpty
                ? chatConversationWeLikeEachOtherRecordList.first
                : null;
        return Title(
            title: 'chatConversation',
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
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CHAT_CONVERSATION_arrow_back_rounded_ICN');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.name,
                        'k',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CHAT_CONVERSATION_Icon_kmqgly0u_ON_TAP');
                          logFirebaseEvent('Icon_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Be careful'),
                                    content: const Text(
                                        'about to delete this chat and all the connections with this user,are you sure?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Icon_backend_call');
                            _model.apiResultvhm = await LikepostCall.call(
                              type: 'breakMatch',
                              myId: currentUserUid,
                              idpersonthatiDontlike: widget.id2,
                            );
                            if ((_model.apiResultvhm?.succeeded ?? true)) {
                              logFirebaseEvent('Icon_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Successfully deletion',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            } else {
                              logFirebaseEvent('Icon_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Some error',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFE21010),
                                ),
                              );
                            }
                          }

                          setState(() {});
                        },
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFFA10B0B),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                  centerTitle: true,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 90.0),
                          child: StreamBuilder<List<MessagesRecord>>(
                            stream: queryMessagesRecord(
                              parent: functions.generateChatId(
                                  currentUserUid, widget.id2!),
                              queryBuilder: (messagesRecord) =>
                                  messagesRecord.orderBy('time'),
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
                              List<MessagesRecord> listViewMessagesRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewMessagesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMessagesRecord =
                                      listViewMessagesRecordList[listViewIndex];
                                  return ChatitemWidget(
                                    key: Key(
                                        'Key7iz_${listViewIndex}_of_${listViewMessagesRecordList.length}'),
                                    messageDocument: listViewMessagesRecord,
                                    userImage: widget.userImage,
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: StreamBuilder<List<WeLikeEachOtherRecord>>(
                              stream: queryWeLikeEachOtherRecord(
                                parent: widget.user2,
                                queryBuilder: (weLikeEachOtherRecord) =>
                                    weLikeEachOtherRecord.where(
                                  'uid',
                                  isEqualTo: currentUserUid,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF0077B5),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<WeLikeEachOtherRecord>
                                    containerWeLikeEachOtherRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerWeLikeEachOtherRecord =
                                    containerWeLikeEachOtherRecordList
                                            .isNotEmpty
                                        ? containerWeLikeEachOtherRecordList
                                            .first
                                        : null;
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'write here something......',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF8F8F8),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: const Color(0xFF020A13),
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CHAT_CONVERSATION_Icon_co2cyyt4_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_backend_call');

                                            await MessagesRecord.createDoc(
                                                    functions.generateChatId(
                                                        currentUserUid,
                                                        widget.id2!)!)
                                                .set(createMessagesRecordData(
                                              text: _model.textController.text,
                                              time: getCurrentTimestamp,
                                              senderId: currentUserUid,
                                            ));
                                            logFirebaseEvent('Icon_scroll_to');
                                            await _model.listViewController
                                                ?.animateTo(
                                              _model.listViewController!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            logFirebaseEvent(
                                                'Icon_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle:
                                                  currentUserDisplayName,
                                              notificationText:
                                                  _model.textController.text,
                                              notificationSound: 'default',
                                              userRefs: [widget.user2!],
                                              initialPageName:
                                                  'chatConversation',
                                              parameterData: {
                                                'name': currentUserDisplayName,
                                                'id2': currentUserUid,
                                                'user2': currentUserReference,
                                                'userImage': currentUserPhoto,
                                                'user2doc':
                                                    currentUserReference,
                                                'welikedocvieweruser':
                                                    chatConversationWeLikeEachOtherRecord,
                                              },
                                            );
                                            logFirebaseEvent(
                                                'Icon_clear_text_fields_pin_codes');
                                            setState(() {
                                              _model.textController?.clear();
                                            });
                                            logFirebaseEvent(
                                                'Icon_backend_call');

                                            await containerWeLikeEachOtherRecord!
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'unseen':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                          },
                                          child: Icon(
                                            Icons.send,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

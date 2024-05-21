import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'facebooktypemessage_model.dart';
export 'facebooktypemessage_model.dart';

class FacebooktypemessageWidget extends StatefulWidget {
  const FacebooktypemessageWidget({
    super.key,
    this.documentReference,
  });

  final DocumentReference? documentReference;

  @override
  State<FacebooktypemessageWidget> createState() =>
      _FacebooktypemessageWidgetState();
}

class _FacebooktypemessageWidgetState extends State<FacebooktypemessageWidget> {
  late FacebooktypemessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacebooktypemessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: FutureBuilder<UsersRecord>(
            future: UsersRecord.getDocumentOnce(widget.documentReference!),
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
              final rowUsersRecord = snapshot.data!;
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FACEBOOKTYPEMESSAGE_Container_h3ayfgcl_O');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            'viewprofile',
                            queryParameters: {
                              'userdoc': serializeParam(
                                rowUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'userdoc': rowUsersRecord,
                            },
                          );
                        },
                        child: Container(
                          width: 50.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                valueOrDefault<String>(
                                  rowUsersRecord.photoUrl,
                                  'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                ),
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rowUsersRecord.displayName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.stairs,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            Text(
                              rowUsersRecord.role,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<List<WeLikeEachOtherRecord>>(
                    stream: queryWeLikeEachOtherRecord(
                      parent: currentUserReference,
                      queryBuilder: (weLikeEachOtherRecord) =>
                          weLikeEachOtherRecord.where(
                        'documentReference',
                        isEqualTo: widget.documentReference,
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF0077B5),
                              ),
                            ),
                          ),
                        );
                      }
                      List<WeLikeEachOtherRecord> rowWeLikeEachOtherRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowWeLikeEachOtherRecord =
                          rowWeLikeEachOtherRecordList.isNotEmpty
                              ? rowWeLikeEachOtherRecordList.first
                              : null;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FACEBOOKTYPEMESSAGE_Row_ll0jmz4k_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed(
                            'chatConversation',
                            queryParameters: {
                              'name': serializeParam(
                                rowUsersRecord.displayName,
                                ParamType.String,
                              ),
                              'id2': serializeParam(
                                rowUsersRecord.uid,
                                ParamType.String,
                              ),
                              'user2': serializeParam(
                                rowUsersRecord.reference,
                                ParamType.DocumentReference,
                              ),
                              'userImage': serializeParam(
                                rowUsersRecord.photoUrl,
                                ParamType.String,
                              ),
                              'user2doc': serializeParam(
                                rowUsersRecord,
                                ParamType.Document,
                              ),
                              'welikedocvieweruser': serializeParam(
                                rowWeLikeEachOtherRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'user2doc': rowUsersRecord,
                              'welikedocvieweruser': rowWeLikeEachOtherRecord,
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'FACEBOOKTYPEMESSAGE_Container_wajsdlq1_O');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    'chatConversation',
                                    queryParameters: {
                                      'name': serializeParam(
                                        rowUsersRecord.displayName,
                                        ParamType.String,
                                      ),
                                      'id2': serializeParam(
                                        rowUsersRecord.uid,
                                        ParamType.String,
                                      ),
                                      'user2': serializeParam(
                                        rowUsersRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'userImage': serializeParam(
                                        rowUsersRecord.photoUrl,
                                        ParamType.String,
                                      ),
                                      'user2doc': serializeParam(
                                        rowUsersRecord,
                                        ParamType.Document,
                                      ),
                                      'welikedocvieweruser': serializeParam(
                                        rowWeLikeEachOtherRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'user2doc': rowUsersRecord,
                                      'welikedocvieweruser':
                                          rowWeLikeEachOtherRecord,
                                    },
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          offset: const Offset(
                                            0.0,
                                            0.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.chat,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'FACEBOOKTYPEMESSAGE_Text_dh0lstod_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_backend_call');
                                                _model.apiResultf3q =
                                                    await LikepostCall.call(
                                                  type: 'weLikeEachOther',
                                                  myId: currentUserUid,
                                                  personthatilike:
                                                      rowUsersRecord.uid,
                                                );
                                                if ((_model.apiResultf3q
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Text_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Suucessfully done',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                } else {
                                                  logFirebaseEvent(
                                                      'Text_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Error',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          const Color(0xFFE21010),
                                                    ),
                                                  );
                                                }

                                                logFirebaseEvent(
                                                    'Text_trigger_push_notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'Your request got accepted!',
                                                  notificationText:
                                                      'chat with them!',
                                                  userRefs: [
                                                    widget.documentReference!
                                                  ],
                                                  initialPageName: 'chatRoom',
                                                  parameterData: {},
                                                );

                                                setState(() {});
                                              },
                                              child: Text(
                                                'Chat',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

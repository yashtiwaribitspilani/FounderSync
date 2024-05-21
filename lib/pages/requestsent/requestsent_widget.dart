import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'requestsent_model.dart';
export 'requestsent_model.dart';

class RequestsentWidget extends StatefulWidget {
  const RequestsentWidget({
    super.key,
    required this.requestsent,
  });

  final SentrequestRecord? requestsent;

  @override
  State<RequestsentWidget> createState() => _RequestsentWidgetState();
}

class _RequestsentWidgetState extends State<RequestsentWidget> {
  late RequestsentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestsentModel());

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
        height: 90.0,
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
            future:
                UsersRecord.getDocumentOnce(widget.requestsent!.userreference!),
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
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('REQUESTSENT_COMP_Row_lwtowdiw_ON_TAP');
                  logFirebaseEvent('Row_navigate_to');

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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
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
                            alignment: const AlignmentDirectional(0.0, 0.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  rowUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Request sent ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                dateTimeFormat(
                                    'relative', widget.requestsent!.time!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.stairs,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                rowUsersRecord.role,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Status: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Stack(
                                children: [
                                  if (widget.requestsent?.status == 'PENDING')
                                    Text(
                                      'Pending',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  if (widget.requestsent?.status == 'ACCEPTED')
                                    Text(
                                      'Accepted',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFF5CB85C),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  if (widget.requestsent?.status == 'REJECTED')
                                    Text(
                                      'Rejected',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        if (functions.ispresentincontactlist(
                            (currentUserDocument?.contactlist.toList() ?? [])
                                .toList(),
                            rowUsersRecord.reference))
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<WeLikeEachOtherRecord>>(
                              stream: queryWeLikeEachOtherRecord(
                                parent: currentUserReference,
                                queryBuilder: (weLikeEachOtherRecord) =>
                                    weLikeEachOtherRecord.where(
                                  'documentReference',
                                  isEqualTo: rowUsersRecord.reference,
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
                                final containerWeLikeEachOtherRecord =
                                    containerWeLikeEachOtherRecordList
                                            .isNotEmpty
                                        ? containerWeLikeEachOtherRecordList
                                            .first
                                        : null;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'REQUESTSENT_Container_fe7612o3_ON_TAP');
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
                                          containerWeLikeEachOtherRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'user2doc': rowUsersRecord,
                                        'welikedocvieweruser':
                                            containerWeLikeEachOtherRecord,
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
                                      width: 70.0,
                                      height: 70.0,
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.chat,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            'Chat',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (!functions.ispresentincontactlist(
                            (currentUserDocument?.contactlist.toList() ?? [])
                                .toList(),
                            rowUsersRecord.reference))
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'REQUESTSENT_Container_adbfpdnx_ON_TAP');
                                logFirebaseEvent('Container_backend_call');

                                await WeLikeEachOtherRecord.createDoc(
                                        currentUserReference!)
                                    .set(createWeLikeEachOtherRecordData(
                                  uid: rowUsersRecord.uid,
                                  documentReference: rowUsersRecord.reference,
                                ));
                                logFirebaseEvent('Container_backend_call');

                                await WeLikeEachOtherRecord.createDoc(
                                        rowUsersRecord.reference)
                                    .set(createWeLikeEachOtherRecordData(
                                  uid: currentUserUid,
                                  documentReference: currentUserReference,
                                ));
                                logFirebaseEvent('Container_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'contactlist': FieldValue.arrayUnion(
                                          [rowUsersRecord.reference]),
                                    },
                                  ),
                                });
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
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'user2doc': rowUsersRecord,
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
                                  width: 70.0,
                                  height: 70.0,
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
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.chat,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Chat',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

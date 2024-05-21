import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'teamuprequest_model.dart';
export 'teamuprequest_model.dart';

class TeamuprequestWidget extends StatefulWidget {
  const TeamuprequestWidget({
    super.key,
    this.documentReference,
    required this.ideadoc,
    required this.userdoc,
    required this.reqref,
  });

  final DocumentReference? documentReference;
  final IdeaRecord? ideadoc;
  final UsersRecord? userdoc;
  final DocumentReference? reqref;

  @override
  State<TeamuprequestWidget> createState() => _TeamuprequestWidgetState();
}

class _TeamuprequestWidgetState extends State<TeamuprequestWidget> {
  late TeamuprequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamuprequestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_model.accepted,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
        child: Container(
          height: 125.0,
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
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  rowUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 3.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'I liked the idea, and I would like to team up ',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 120.0,
                                    height: 25.0,
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
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'TEAMUPREQUEST_COMP_Row_263nr0ik_ON_TAP');
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.ideadoc!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'requests':
                                                  FieldValue.arrayRemove(
                                                      [widget.userdoc?.uid]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.ideadoc!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'subscriberlist':
                                                  FieldValue.arrayUnion([
                                                widget.documentReference
                                              ]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.ideadoc!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'teamups': FieldValue.arrayUnion(
                                                  [widget.userdoc?.uid]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');

                                        await TeamupRecord.collection
                                            .doc()
                                            .set(createTeamupRecordData(
                                              idearef:
                                                  widget.ideadoc?.reference,
                                              userref: widget.documentReference,
                                            ));
                                        logFirebaseEvent('Row_backend_call');

                                        await WeLikeEachOtherRecord.createDoc(
                                                currentUserReference!)
                                            .set(
                                                createWeLikeEachOtherRecordData(
                                          uid: widget.userdoc?.uid,
                                          documentReference:
                                              widget.documentReference,
                                        ));
                                        logFirebaseEvent('Row_backend_call');

                                        await WeLikeEachOtherRecord.createDoc(
                                                rowUsersRecord.reference)
                                            .set(
                                                createWeLikeEachOtherRecordData(
                                          uid: currentUserUid,
                                          documentReference:
                                              currentUserReference,
                                        ));
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.documentReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'teamedupidea':
                                                  FieldValue.arrayUnion([
                                                widget.ideadoc?.reference
                                              ]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');
                                        await widget.reqref!.delete();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.check,
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            size: 18.0,
                                          ),
                                          Text(
                                            'Accept ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
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
                              Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: 120.0,
                                  height: 25.0,
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
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'TEAMUPREQUEST_COMP_Row_f3d3abgy_ON_TAP');
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.ideadoc!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'requests':
                                                  FieldValue.arrayRemove([
                                                widget.documentReference?.id
                                              ]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');

                                        await widget.ideadoc!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'rejected':
                                                  FieldValue.arrayUnion([
                                                widget.documentReference?.id
                                              ]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Row_backend_call');
                                        await widget.reqref!.delete();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.cancel_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 18.0,
                                          ),
                                          Text(
                                            'Reject',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
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
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

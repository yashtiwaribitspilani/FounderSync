import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/ideasent/ideasent_widget.dart';
import '/pages/nolike/nolike_widget.dart';
import '/pages/teamuprequestlikepagecard/teamuprequestlikepagecard_widget.dart';
import 'package:flutter/material.dart';
import 'ideatabbar_model.dart';
export 'ideatabbar_model.dart';

class IdeatabbarWidget extends StatefulWidget {
  const IdeatabbarWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<IdeatabbarWidget> createState() => _IdeatabbarWidgetState();
}

class _IdeatabbarWidgetState extends State<IdeatabbarWidget>
    with TickerProviderStateMixin {
  late IdeatabbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IdeatabbarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 1,
    )..addListener(() => setState(() {}));
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
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        children: [
          Align(
            alignment: const Alignment(0.0, 0),
            child: FlutterFlowButtonTabBar(
              useToggleButtonStyle: false,
              labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                  ),
              unselectedLabelStyle: const TextStyle(),
              labelColor: FlutterFlowTheme.of(context).primaryBackground,
              unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              unselectedBackgroundColor: FlutterFlowTheme.of(context).alternate,
              borderColor: FlutterFlowTheme.of(context).primary,
              unselectedBorderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              elevation: 0.0,
              buttonMargin: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              padding: const EdgeInsets.all(4.0),
              tabs: const [
                Tab(
                  text: 'Sent',
                ),
                Tab(
                  text: 'Recieved',
                ),
              ],
              controller: _model.tabBarController,
              onTap: (i) async {
                [() async {}, () async {}][i]();
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _model.tabBarController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                  child: StreamBuilder<List<IdeasentRecord>>(
                    stream: queryIdeasentRecord(
                      queryBuilder: (ideasentRecord) => ideasentRecord.where(
                        'userwhorequestedteamup',
                        isEqualTo: currentUserReference,
                      ),
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
                      List<IdeasentRecord> listViewIdeasentRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewIdeasentRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewIdeasentRecord =
                              listViewIdeasentRecordList[listViewIndex];
                          return IdeasentWidget(
                            key: Key(
                                'Keyl62_${listViewIndex}_of_${listViewIdeasentRecordList.length}'),
                            requestsent: listViewIdeasentRecord,
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: StreamBuilder<List<RequestsRecord>>(
                          stream: queryRequestsRecord(
                            queryBuilder: (requestsRecord) =>
                                requestsRecord.where(
                              'ideaowner',
                              isEqualTo: currentUserReference,
                            ),
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
                            List<RequestsRecord> listViewRequestsRecordList =
                                snapshot.data!;
                            if (listViewRequestsRecordList.isEmpty) {
                              return const NolikeWidget();
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewRequestsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewRequestsRecord =
                                    listViewRequestsRecordList[listViewIndex];
                                return TeamuprequestlikepagecardWidget(
                                  key: Key(
                                      'Keymex_${listViewIndex}_of_${listViewRequestsRecordList.length}'),
                                  reqref: listViewRequestsRecord.reference,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/startupsent/startupsent_widget.dart';
import '/pages/startupteamuprequestpagecard/startupteamuprequestpagecard_widget.dart';
import 'package:flutter/material.dart';
import 'startuptabbar_model.dart';
export 'startuptabbar_model.dart';

class StartuptabbarWidget extends StatefulWidget {
  const StartuptabbarWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<StartuptabbarWidget> createState() => _StartuptabbarWidgetState();
}

class _StartuptabbarWidgetState extends State<StartuptabbarWidget>
    with TickerProviderStateMixin {
  late StartuptabbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartuptabbarModel());

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
                StreamBuilder<List<StartupsentRecord>>(
                  stream: queryStartupsentRecord(
                    queryBuilder: (startupsentRecord) =>
                        startupsentRecord.where(
                      'userwhorequestedteamupstartup',
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
                    List<StartupsentRecord> listViewStartupsentRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewStartupsentRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewStartupsentRecord =
                            listViewStartupsentRecordList[listViewIndex];
                        return StartupsentWidget(
                          key: Key(
                              'Keya6j_${listViewIndex}_of_${listViewStartupsentRecordList.length}'),
                          requestsent: listViewStartupsentRecord,
                        );
                      },
                    );
                  },
                ),
                StreamBuilder<List<StartupRequestTeamUpRecord>>(
                  stream: queryStartupRequestTeamUpRecord(
                    queryBuilder: (startupRequestTeamUpRecord) =>
                        startupRequestTeamUpRecord.where(
                      'startupowner',
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
                    List<StartupRequestTeamUpRecord>
                        listViewStartupRequestTeamUpRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewStartupRequestTeamUpRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewStartupRequestTeamUpRecord =
                            listViewStartupRequestTeamUpRecordList[
                                listViewIndex];
                        return StartupteamuprequestpagecardWidget(
                          key: Key(
                              'Keyt1t_${listViewIndex}_of_${listViewStartupRequestTeamUpRecordList.length}'),
                          reqref: listViewStartupRequestTeamUpRecord.reference,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

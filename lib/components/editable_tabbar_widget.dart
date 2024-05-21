import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/userprofilestartuppage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/education/education_widget.dart';
import '/pages/jobcard2editable/jobcard2editable_widget.dart';
import 'package:flutter/material.dart';
import 'editable_tabbar_model.dart';
export 'editable_tabbar_model.dart';

class EditableTabbarWidget extends StatefulWidget {
  const EditableTabbarWidget({super.key});

  @override
  State<EditableTabbarWidget> createState() => _EditableTabbarWidgetState();
}

class _EditableTabbarWidgetState extends State<EditableTabbarWidget>
    with TickerProviderStateMixin {
  late EditableTabbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditableTabbarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
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
    return Column(
      children: [
        Align(
          alignment: const Alignment(0.0, 0),
          child: TabBar(
            isScrollable: true,
            labelColor: FlutterFlowTheme.of(context).primaryText,
            unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
            unselectedLabelStyle: const TextStyle(),
            indicatorColor: FlutterFlowTheme.of(context).primary,
            padding: const EdgeInsets.all(4.0),
            tabs: const [
              Tab(
                text: 'Startup',
              ),
              Tab(
                text: 'Work Experience',
              ),
              Tab(
                text: 'Education',
              ),
            ],
            controller: _model.tabBarController,
            onTap: (i) async {
              [() async {}, () async {}, () async {}][i]();
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _model.tabBarController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: FutureBuilder<List<StartupRecord>>(
                  future: queryStartupRecordOnce(
                    queryBuilder: (startupRecord) => startupRecord.where(
                      'userstartup',
                      isEqualTo: currentUserReference,
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
                    List<StartupRecord> listViewStartupRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final listViewStartupRecord =
                        listViewStartupRecordList.isNotEmpty
                            ? listViewStartupRecordList.first
                            : null;
                    return ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        wrapWithModel(
                          model: _model.userprofilestartuppageModel,
                          updateCallback: () => setState(() {}),
                          child: UserprofilestartuppageWidget(
                            logo: listViewStartupRecord!.logo,
                            name: listViewStartupRecord.name,
                            description: listViewStartupRecord.description,
                            stage: listViewStartupRecord.stage,
                            team: listViewStartupRecord.teamsize,
                            users: listViewStartupRecord.users.toString(),
                            date: listViewStartupRecord.foundedon,
                            startupreference: listViewStartupRecord,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: StreamBuilder<List<WorkerRecord>>(
                      stream: queryWorkerRecord(
                        queryBuilder: (workerRecord) => workerRecord.where(
                          'work',
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
                        List<WorkerRecord> listViewWorkerRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewWorkerRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewWorkerRecord =
                                listViewWorkerRecordList[listViewIndex];
                            return Jobcard2editableWidget(
                              key: Key(
                                  'Keyrpi_${listViewIndex}_of_${listViewWorkerRecordList.length}'),
                              role: listViewWorkerRecord.role,
                              companyname: listViewWorkerRecord.companyname,
                              description: listViewWorkerRecord.description,
                              startdate: listViewWorkerRecord.startdate,
                              enddate: listViewWorkerRecord.enddate,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDITABLE_TABBAR_ADD_WORK_EXPERIENCE_BTN_');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('add_work');
                        },
                        text: 'Add Work Experience',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: StreamBuilder<List<EducationRecord>>(
                      stream: queryEducationRecord(
                        queryBuilder: (educationRecord) =>
                            educationRecord.where(
                          'usereducation',
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
                        List<EducationRecord> listViewEducationRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewEducationRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEducationRecord =
                                listViewEducationRecordList[listViewIndex];
                            return EducationWidget(
                              key: Key(
                                  'Keyhxj_${listViewIndex}_of_${listViewEducationRecordList.length}'),
                              degree: listViewEducationRecord.degree,
                              college: listViewEducationRecord.collegename,
                              branch: listViewEducationRecord.branch,
                              startyear: listViewEducationRecord.startyear,
                              endyear: listViewEducationRecord.endyear,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDITABLE_TABBAR_ADD_EDUCATION_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('add_education');
                        },
                        text: 'Add Education',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
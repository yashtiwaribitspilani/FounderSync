import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/userprofile_linked_in_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/education/education_widget.dart';
import '/pages/jobcard2editable/jobcard2editable_widget.dart';
import 'package:flutter/material.dart';
import 'linked_ineditable_tabbar_model.dart';
export 'linked_ineditable_tabbar_model.dart';

class LinkedIneditableTabbarWidget extends StatefulWidget {
  const LinkedIneditableTabbarWidget({super.key});

  @override
  State<LinkedIneditableTabbarWidget> createState() =>
      _LinkedIneditableTabbarWidgetState();
}

class _LinkedIneditableTabbarWidgetState
    extends State<LinkedIneditableTabbarWidget> with TickerProviderStateMixin {
  late LinkedIneditableTabbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkedIneditableTabbarModel());

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
    return Stack(
      children: [
        Column(
          children: [
            Align(
              alignment: const Alignment(0.0, 0),
              child: TabBar(
                isScrollable: true,
                labelColor: FlutterFlowTheme.of(context).primaryText,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
                unselectedLabelStyle:
                    FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                indicatorColor: FlutterFlowTheme.of(context).primary,
                padding: const EdgeInsets.all(4.0),
                tabs: const [
                  Tab(
                    text: 'Personal Details',
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
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
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewUsersRecord =
                            listViewUsersRecordList.isNotEmpty
                                ? listViewUsersRecordList.first
                                : null;
                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.userprofileLinkedInPageModel,
                                updateCallback: () => setState(() {}),
                                child: UserprofileLinkedInPageWidget(
                                  logo: currentUserPhoto,
                                  name: listViewUsersRecord!.displayName,
                                  userreference: listViewUsersRecord,
                                ),
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
                                      'Keymps_${listViewIndex}_of_${listViewWorkerRecordList.length}'),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LINKED_INEDITABLE_TABBAR_ADD_WORK_EXPERI');
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                                      'Key4fd_${listViewIndex}_of_${listViewEducationRecordList.length}'),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LINKED_INEDITABLE_TABBAR_ADD_EDUCATION_B');
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('LINKED_INEDITABLE_TABBAR_CONTINUE_WITHOU');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(
                  'people',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              text: 'Continue without LinkedIn',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/education/education_widget.dart';
import '/pages/jobcard2/jobcard2_widget.dart';
import '/pages/noeducation/noeducation_widget.dart';
import '/pages/nowork/nowork_widget.dart';
import '/pages/userprofilestartuppageswipepage/userprofilestartuppageswipepage_widget.dart';
import 'package:flutter/material.dart';
import 'tabbarswipe_model.dart';
export 'tabbarswipe_model.dart';

class TabbarswipeWidget extends StatefulWidget {
  const TabbarswipeWidget({
    super.key,
    required this.userviewer,
  });

  final DocumentReference? userviewer;

  @override
  State<TabbarswipeWidget> createState() => _TabbarswipeWidgetState();
}

class _TabbarswipeWidgetState extends State<TabbarswipeWidget>
    with TickerProviderStateMixin {
  late TabbarswipeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabbarswipeModel());

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.tabBarController2 = TabController(
      vsync: this,
      length: 2,
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userviewer!),
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
        final stackUsersRecord = snapshot.data!;
        return Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Visibility(
                    visible: stackUsersRecord.startupexist,
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
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
                            controller: _model.tabBarController1,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController1,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<StartupRecord>>(
                                  stream: queryStartupRecord(
                                    queryBuilder: (startupRecord) =>
                                        startupRecord.where(
                                      'userstartup',
                                      isEqualTo: widget.userviewer,
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
                                    List<StartupRecord>
                                        listViewStartupRecordList =
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
                                          model: _model
                                              .userprofilestartuppageswipepageModel,
                                          updateCallback: () => setState(() {}),
                                          child:
                                              UserprofilestartuppageswipepageWidget(
                                            logo: listViewStartupRecord!.logo,
                                            name: listViewStartupRecord.name,
                                            description: listViewStartupRecord
                                                .description,
                                            stage: listViewStartupRecord.stage,
                                            team:
                                                listViewStartupRecord.teamsize,
                                            users: listViewStartupRecord.users
                                                .toString(),
                                            date: listViewStartupRecord
                                                .foundedon,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<WorkerRecord>>(
                                  stream: queryWorkerRecord(
                                    queryBuilder: (workerRecord) =>
                                        workerRecord.where(
                                      'work',
                                      isEqualTo: widget.userviewer,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFF0077B5),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<WorkerRecord>
                                        listViewWorkerRecordList =
                                        snapshot.data!;
                                    if (listViewWorkerRecordList.isEmpty) {
                                      return const NoworkWidget();
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewWorkerRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewWorkerRecord =
                                            listViewWorkerRecordList[
                                                listViewIndex];
                                        return Jobcard2Widget(
                                          key: Key(
                                              'Key3dp_${listViewIndex}_of_${listViewWorkerRecordList.length}'),
                                          role: listViewWorkerRecord.role,
                                          companyname:
                                              listViewWorkerRecord.companyname,
                                          description:
                                              listViewWorkerRecord.description,
                                          startdate:
                                              listViewWorkerRecord.startdate,
                                          enddate: listViewWorkerRecord.enddate,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              StreamBuilder<List<EducationRecord>>(
                                stream: queryEducationRecord(
                                  queryBuilder: (educationRecord) =>
                                      educationRecord.where(
                                    'usereducation',
                                    isEqualTo: widget.userviewer,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFF0077B5),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<EducationRecord>
                                      listViewEducationRecordList =
                                      snapshot.data!;
                                  if (listViewEducationRecordList.isEmpty) {
                                    return const NoeducationWidget();
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewEducationRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewEducationRecord =
                                          listViewEducationRecordList[
                                              listViewIndex];
                                      return EducationWidget(
                                        key: Key(
                                            'Keyppk_${listViewIndex}_of_${listViewEducationRecordList.length}'),
                                        degree: listViewEducationRecord.degree,
                                        college:
                                            listViewEducationRecord.collegename,
                                        branch: listViewEducationRecord.branch,
                                        startyear:
                                            listViewEducationRecord.startyear,
                                        endyear:
                                            listViewEducationRecord.endyear,
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
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Visibility(
                  visible: !stackUsersRecord.startupexist,
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: const EdgeInsets.all(4.0),
                          tabs: const [
                            Tab(
                              text: 'Work Experience',
                            ),
                            Tab(
                              text: 'Education',
                            ),
                          ],
                          controller: _model.tabBarController2,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<WorkerRecord>>(
                                stream: queryWorkerRecord(
                                  queryBuilder: (workerRecord) =>
                                      workerRecord.where(
                                    'work',
                                    isEqualTo: widget.userviewer,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFF0077B5),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<WorkerRecord> listViewWorkerRecordList =
                                      snapshot.data!;
                                  if (listViewWorkerRecordList.isEmpty) {
                                    return const NoworkWidget();
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewWorkerRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewWorkerRecord =
                                          listViewWorkerRecordList[
                                              listViewIndex];
                                      return Jobcard2Widget(
                                        key: Key(
                                            'Key7qv_${listViewIndex}_of_${listViewWorkerRecordList.length}'),
                                        role: listViewWorkerRecord.role,
                                        companyname:
                                            listViewWorkerRecord.companyname,
                                        description:
                                            listViewWorkerRecord.description,
                                        startdate:
                                            listViewWorkerRecord.startdate,
                                        enddate: listViewWorkerRecord.enddate,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            StreamBuilder<List<EducationRecord>>(
                              stream: queryEducationRecord(
                                queryBuilder: (educationRecord) =>
                                    educationRecord.where(
                                  'usereducation',
                                  isEqualTo: widget.userviewer,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF0077B5),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EducationRecord>
                                    listViewEducationRecordList =
                                    snapshot.data!;
                                if (listViewEducationRecordList.isEmpty) {
                                  return const NoeducationWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEducationRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEducationRecord =
                                        listViewEducationRecordList[
                                            listViewIndex];
                                    return EducationWidget(
                                      key: Key(
                                          'Keyprb_${listViewIndex}_of_${listViewEducationRecordList.length}'),
                                      degree: listViewEducationRecord.degree,
                                      college:
                                          listViewEducationRecord.collegename,
                                      branch: listViewEducationRecord.branch,
                                      startyear:
                                          listViewEducationRecord.startyear,
                                      endyear: listViewEducationRecord.endyear,
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
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/facebooktypemessage/facebooktypemessage_widget.dart';
import '/pages/item_userlikesme/item_userlikesme_widget.dart';
import '/pages/nolike/nolike_widget.dart';
import '/pages/norequestsent/norequestsent_widget.dart';
import '/pages/requestsent/requestsent_widget.dart';
import 'package:flutter/material.dart';
import 'peopletabbar_model.dart';
export 'peopletabbar_model.dart';

class PeopletabbarWidget extends StatefulWidget {
  const PeopletabbarWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<PeopletabbarWidget> createState() => _PeopletabbarWidgetState();
}

class _PeopletabbarWidgetState extends State<PeopletabbarWidget>
    with TickerProviderStateMixin {
  late PeopletabbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeopletabbarModel());

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
    return StreamBuilder<List<IdeaRecord>>(
      stream: queryIdeaRecord(),
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
        List<IdeaRecord> tabBarIdeaRecordList = snapshot.data!;
        return Column(
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
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                backgroundColor: FlutterFlowTheme.of(context).primary,
                unselectedBackgroundColor:
                    FlutterFlowTheme.of(context).alternate,
                borderColor: FlutterFlowTheme.of(context).primary,
                unselectedBorderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                elevation: 0.0,
                buttonMargin:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                  Stack(
                    children: [
                      if ((currentUserDocument?.liked.toList() ?? [])
                          .isNotEmpty)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 90.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<SentrequestRecord>>(
                              stream: querySentrequestRecord(
                                parent: currentUserReference,
                                queryBuilder: (sentrequestRecord) =>
                                    sentrequestRecord.orderBy('time',
                                        descending: true),
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
                                List<SentrequestRecord>
                                    listViewSentrequestRecordList =
                                    snapshot.data!;
                                if (listViewSentrequestRecordList.isEmpty) {
                                  return const NorequestsentWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewSentrequestRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewSentrequestRecord =
                                        listViewSentrequestRecordList[
                                            listViewIndex];
                                    return RequestsentWidget(
                                      key: Key(
                                          'Keywa6_${listViewIndex}_of_${listViewSentrequestRecordList.length}'),
                                      requestsent: listViewSentrequestRecord,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: StreamBuilder<List<LikemypostRecord>>(
                            stream: queryLikemypostRecord(
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
                              List<LikemypostRecord>
                                  listViewLikemypostRecordList = snapshot.data!;
                              if (listViewLikemypostRecordList.isEmpty) {
                                return const NolikeWidget();
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewLikemypostRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewLikemypostRecord =
                                      listViewLikemypostRecordList[
                                          listViewIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.itemUserlikesmeModels.getModel(
                                        listViewLikemypostRecord.uid,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: ItemUserlikesmeWidget(
                                        key: Key(
                                          'Keybvk_${listViewLikemypostRecord.uid}',
                                        ),
                                        documentReference:
                                            listViewLikemypostRecord.docref,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        StreamBuilder<List<AcceptedrequestsRecord>>(
                          stream: queryAcceptedrequestsRecord(
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
                            List<AcceptedrequestsRecord>
                                listViewAcceptedrequestsRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  listViewAcceptedrequestsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewAcceptedrequestsRecord =
                                    listViewAcceptedrequestsRecordList[
                                        listViewIndex];
                                return FacebooktypemessageWidget(
                                  key: Key(
                                      'Keym4l_${listViewIndex}_of_${listViewAcceptedrequestsRecordList.length}'),
                                  documentReference:
                                      listViewAcceptedrequestsRecord
                                          .userreference,
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
          ],
        );
      },
    );
  }
}

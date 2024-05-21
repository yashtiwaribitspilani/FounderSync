import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/linked_in_p_o_p_u_p_r_e_q_u_e_s_t_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/components/tabbarswipe_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/noprofileleft/noprofileleft_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'people_model.dart';
export 'people_model.dart';

class PeopleWidget extends StatefulWidget {
  const PeopleWidget({super.key});

  @override
  State<PeopleWidget> createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  late PeopleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeopleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'people'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PEOPLE_PAGE_people_ON_INIT_STATE');
      logFirebaseEvent('people_update_page_state');
      setState(() {
        _model.toursteps = valueOrDefault(currentUserDocument?.tourstep, 0);
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'reviewed',
          isEqualTo: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
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
        List<UsersRecord> peopleUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        return Title(
            title: 'people',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 80.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 10.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Stack(
                                          children: [
                                            FlutterFlowChoiceChips(
                                              options: const [
                                                ChipData('People',
                                                    Icons.person_rounded),
                                                ChipData(
                                                    'Idea',
                                                    FontAwesomeIcons
                                                        .solidLightbulb),
                                                ChipData('Start-up',
                                                    Icons.currency_rupee)
                                              ],
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.choiceChipsValue =
                                                        val?.firstOrNull);
                                                logFirebaseEvent(
                                                    'PEOPLE_ChoiceChips_o09e54o3_ON_FORM_WIDG');
                                                if (_model.choiceChipsValue ==
                                                    'Idea') {
                                                  logFirebaseEvent(
                                                      'ChoiceChips_navigate_to');

                                                  context.pushNamed(
                                                    'ideaPage',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  if (_model.choiceChipsValue ==
                                                      'Start-up') {
                                                    logFirebaseEvent(
                                                        'ChoiceChips_navigate_to');

                                                    context.pushNamed(
                                                      'startUpPage',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                }
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                iconSize: 18.0,
                                                labelPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            1.0, 0.0, 0.0, 0.0),
                                                elevation: 4.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 5.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['People'],
                                              ),
                                              wrapped: true,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PEOPLE_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'filters',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            text: '',
                                            icon: Icon(
                                              Icons.settings_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 18.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 35.0,
                                              height: 35.0,
                                              padding: const EdgeInsets.all(8.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 25.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Builder(
                                        builder: (context) {
                                          final filtereduserlist = functions
                                                  .filterlist(
                                                      peopleUsersRecordList
                                                          .toList(),
                                                      (currentUserDocument
                                                                  ?.liked
                                                                  .toList() ??
                                                              [])
                                                          .toList(),
                                                      (currentUserDocument
                                                                  ?.rejected
                                                                  .toList() ??
                                                              [])
                                                          .toList(),
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.rolefilter,
                                                          ''),
                                                      valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.nearme,
                                                          false),
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.city,
                                                          ''),
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.state,
                                                          ''),
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.lookingforfilter,
                                                          ''))
                                                  ?.toList() ??
                                              [];
                                          if (filtereduserlist.isEmpty) {
                                            return const NoprofileleftWidget();
                                          }
                                          return FlutterFlowSwipeableStack(
                                            onSwipeFn: (index) {},
                                            onLeftSwipe: (index) async {
                                              logFirebaseEvent(
                                                  'PEOPLE_SwipeableStack_c1zylvbb_ON_LEFT_S');
                                              final filtereduserlistItem =
                                                  filtereduserlist[index];
                                              // Action 2LS
                                              logFirebaseEvent(
                                                  'SwipeableStack_Action2LS');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'noofswipes':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                              // Action 1LS
                                              logFirebaseEvent(
                                                  'SwipeableStack_Action1LS');

                                              await currentUserReference!
                                                  .update({
                                                ...createUsersRecordData(
                                                  lastswipeduseruid:
                                                      filtereduserlist[index]
                                                          .uid,
                                                  lastswipeduserref:
                                                      filtereduserlist[index]
                                                          .reference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'rejected':
                                                        FieldValue.arrayUnion([
                                                      filtereduserlist[index]
                                                          .uid
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'SwipeableStack_hide_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              // Action 2LS
                                              logFirebaseEvent(
                                                  'SwipeableStack_Action2LS');
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Rejected',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      const Color(0xFFD23944),
                                                ),
                                              );
                                              if (!valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.islinkedIndone,
                                                      false) &&
                                                  !valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.notshowlinkedinreminder,
                                                      false) &&
                                                  (functions.remainder(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.noofswipes,
                                                              0)) ==
                                                      0)) {
                                                logFirebaseEvent(
                                                    'SwipeableStack_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const LinkedInPOPUPREQUESTWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            },
                                            onRightSwipe: (index) async {
                                              logFirebaseEvent(
                                                  'PEOPLE_SwipeableStack_c1zylvbb_ON_RIGHT_');
                                              final filtereduserlistItem =
                                                  filtereduserlist[index];
                                              logFirebaseEvent(
                                                  'SwipeableStack_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'noofswipes':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'SwipeableStack_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'liked':
                                                        FieldValue.arrayUnion([
                                                      filtereduserlist[index]
                                                          .uid
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'SwipeableStack_backend_call');

                                              await SentrequestRecord.createDoc(
                                                      currentUserReference!)
                                                  .set(
                                                      createSentrequestRecordData(
                                                userreference:
                                                    filtereduserlist[index]
                                                        .reference,
                                                time: getCurrentTimestamp,
                                                status: 'PENDING',
                                              ));
                                              logFirebaseEvent(
                                                  'SwipeableStack_backend_call');
                                              _model.apiResult0wb1 =
                                                  await LikepostCall.call(
                                                type: 'personilikes',
                                                myId: currentUserUid,
                                                personthatilike:
                                                    filtereduserlist[index]
                                                        .uid,
                                              );
                                              if ((_model.apiResult0wb1
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'SwipeableStack_hide_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                logFirebaseEvent(
                                                    'SwipeableStack_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'successfully like',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    'SwipeableStack_hide_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                logFirebaseEvent(
                                                    'SwipeableStack_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Error occured',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        const Color(0xFFFB1A0E),
                                                  ),
                                                );
                                              }

                                              if (!valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.islinkedIndone,
                                                      false) &&
                                                  !valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.notshowlinkedinreminder,
                                                      false) &&
                                                  (functions.remainder(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.noofswipes,
                                                              0)) ==
                                                      0)) {
                                                logFirebaseEvent(
                                                    'SwipeableStack_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const LinkedInPOPUPREQUESTWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            onUpSwipe: (index) {},
                                            onDownSwipe: (index) {},
                                            itemBuilder: (context,
                                                filtereduserlistIndex) {
                                              final filtereduserlistItem =
                                                  filtereduserlist[
                                                      filtereduserlistIndex];
                                              return Stack(
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  55.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      5.0,
                                                                  color: Color(
                                                                      0x230F1113),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          10.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 80.0,
                                                                              height: 80.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  child: Image.network(
                                                                                    filtereduserlistItem.photoUrl,
                                                                                    width: 80.0,
                                                                                    height: 80.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    filtereduserlistItem.role,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '(potential)',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    filtereduserlistItem.displayName,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Lives in ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      filtereduserlistItem.city,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      ',',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      filtereduserlistItem.state,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
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
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        10.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions.textreturner(
                                                                  _model
                                                                      .collapsed,
                                                                  filtereduserlistItem
                                                                      .description),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'PEOPLE_PAGE_Text_nnchtxd3_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Text_update_page_state');
                                                                    setState(
                                                                        () {
                                                                      _model.collapsed =
                                                                          !_model
                                                                              .collapsed;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    functions.showmoreless(
                                                                        _model
                                                                            .collapsed,
                                                                        filtereduserlistItem
                                                                            .description),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    TabbarswipeWidget(
                                                                  key: Key(
                                                                      'Keyt23_${filtereduserlistIndex}_of_${filtereduserlist.length}'),
                                                                  userviewer:
                                                                      filtereduserlistItem
                                                                          .reference,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.4, 1.15),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PEOPLE_PAGE_Container_dutctiu0_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Container_backend_call');

                                                          await WeLikeEachOtherRecord
                                                                  .createDoc(
                                                                      currentUserReference!)
                                                              .set(
                                                                  createWeLikeEachOtherRecordData(
                                                            uid:
                                                                filtereduserlistItem
                                                                    .uid,
                                                            documentReference:
                                                                filtereduserlistItem
                                                                    .reference,
                                                          ));
                                                          logFirebaseEvent(
                                                              'Container_backend_call');

                                                          await WeLikeEachOtherRecord
                                                                  .createDoc(
                                                                      filtereduserlistItem
                                                                          .reference)
                                                              .set(
                                                                  createWeLikeEachOtherRecordData(
                                                            uid: currentUserUid,
                                                            documentReference:
                                                                currentUserReference,
                                                          ));
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'chatConversation',
                                                            queryParameters: {
                                                              'name':
                                                                  serializeParam(
                                                                filtereduserlistItem
                                                                    .displayName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'id2':
                                                                  serializeParam(
                                                                filtereduserlistItem
                                                                    .uid,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'user2':
                                                                  serializeParam(
                                                                filtereduserlistItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'userImage':
                                                                  serializeParam(
                                                                filtereduserlistItem
                                                                    .photoUrl,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'user2doc':
                                                                  serializeParam(
                                                                filtereduserlistItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'user2doc':
                                                                  filtereduserlistItem,
                                                            },
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60.0),
                                                          ),
                                                          child: Container(
                                                            width: 65.0,
                                                            height: 65.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  offset:
                                                                      const Offset(
                                                                    0.0,
                                                                    0.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          60.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .chat_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          26.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Premium Chat',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount: filtereduserlist.length,
                                            controller:
                                                _model.swipeableStackController,
                                            loop: false,
                                            cardDisplayCount: 2,
                                            scale: 0.9,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.toursteps == 0)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PEOPLE_PAGE_Image_uetnzy7e_ON_TAP');
                              logFirebaseEvent('Image_update_page_state');
                              setState(() {
                                _model.toursteps = _model.toursteps! + 1;
                              });
                              logFirebaseEvent('Image_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'tourstep': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Journey_New_28.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (_model.toursteps == 1)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PEOPLE_PAGE_Image_zb2cmkzm_ON_TAP');
                              logFirebaseEvent('Image_update_page_state');
                              setState(() {
                                _model.toursteps = _model.toursteps! + 1;
                              });
                              logFirebaseEvent('Image_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'tourstep': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Journey_New_29.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (_model.toursteps == 2)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PEOPLE_PAGE_Image_rj7utr6q_ON_TAP');
                              logFirebaseEvent('Image_update_page_state');
                              setState(() {
                                _model.toursteps = _model.toursteps! + 1;
                              });
                              logFirebaseEvent('Image_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'tourstep': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Journey_New_30.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (_model.toursteps == 3)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PEOPLE_PAGE_Image_gct7d7tz_ON_TAP');
                              logFirebaseEvent('Image_update_page_state');
                              setState(() {
                                _model.toursteps = _model.toursteps! + 1;
                              });
                              logFirebaseEvent('Image_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'tourstep': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Journey_New_31.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (_model.toursteps == 4)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PEOPLE_PAGE_Image_66zigjkc_ON_TAP');
                              logFirebaseEvent('Image_update_page_state');
                              setState(() {
                                _model.toursteps = _model.toursteps! + 1;
                              });
                              logFirebaseEvent('Image_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'tourstep': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Journey_New_32.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 90.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                              child: Stack(
                                children: [
                                  wrapWithModel(
                                    model: _model.navBar1Model,
                                    updateCallback: () => setState(() {}),
                                    child: const NavBar1Widget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.47, 0.76),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 28.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PEOPLE_PAGE_Container_o7ug7lbc_ON_TAP');
                                if (currentUserDocument?.lastswipeduserref !=
                                    null) {
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    'peopleUndopage',
                                    queryParameters: {
                                      'userref': serializeParam(
                                        currentUserDocument?.lastswipeduserref,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  logFirebaseEvent('Container_backend_call');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'rejected': FieldValue.arrayRemove([
                                          valueOrDefault(
                                              currentUserDocument
                                                  ?.lastswipeduseruid,
                                              '')
                                        ]),
                                      },
                                    ),
                                  });
                                } else {
                                  logFirebaseEvent('Container_hide_snack_bar');
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  logFirebaseEvent('Container_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No changes to undo!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                                child: Container(
                                  width: 65.0,
                                  height: 65.0,
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
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 3.0),
                                        child: Icon(
                                          Icons.undo_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          'Undo',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
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
                        if (valueOrDefault(
                                currentUserDocument?.noofswipes, 0) <=
                            2)
                          Align(
                            alignment: const AlignmentDirectional(-0.92, -0.39),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 80.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x320077B5),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/left-arrow.png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Reject',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                        if (valueOrDefault(
                                currentUserDocument?.noofswipes, 0) <=
                            2)
                          Align(
                            alignment: const AlignmentDirectional(0.92, -0.39),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 80.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x320077B5),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Accept',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/right-arrow.png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}

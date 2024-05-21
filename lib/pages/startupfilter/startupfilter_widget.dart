import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'startupfilter_model.dart';
export 'startupfilter_model.dart';

class StartupfilterWidget extends StatefulWidget {
  const StartupfilterWidget({super.key});

  @override
  State<StartupfilterWidget> createState() => _StartupfilterWidgetState();
}

class _StartupfilterWidgetState extends State<StartupfilterWidget> {
  late StartupfilterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartupfilterModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'startupfilter'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'startupfilter',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 10.0),
                          child: Icon(
                            Icons.factory_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 0.0, 10.0),
                          child: Text(
                            'Start-up industry type filter',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowChoiceChips(
                        options: const [
                          ChipData('All'),
                          ChipData('AgroTech'),
                          ChipData('HealthTech'),
                          ChipData('EdTech'),
                          ChipData('RetailTech'),
                          ChipData('TravelTech'),
                          ChipData('CleanTech'),
                          ChipData('FinTech/InsurTech'),
                          ChipData('Agri/FoodTech'),
                          ChipData('Cybersecurity'),
                          ChipData('E-commerce'),
                          ChipData('Fashion'),
                          ChipData('AI/ML/Big-Data'),
                          ChipData('Climate/CleanTech'),
                          ChipData('Enterprise SaaS'),
                          ChipData('HRTech'),
                          ChipData('Web3/ Crypto'),
                          ChipData('Creator Economy'),
                          ChipData('Hardware/IoT'),
                          ChipData('Electric Mobility/AutoTech'),
                          ChipData('Gaming/Esports'),
                          ChipData('Manufacturing'),
                          ChipData('Real Estate/ PropTech'),
                          ChipData('Marketplaces'),
                          ChipData('Travel '),
                          ChipData('Logistics'),
                          ChipData('Others')
                        ],
                        onChanged: (val) async {
                          setState(() =>
                              _model.choiceChipsValue1 = val?.firstOrNull);
                          logFirebaseEvent(
                              'STARTUPFILTER_ChoiceChips_fmlvfecv_ON_FO');
                          logFirebaseEvent('ChoiceChips_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            startupindustrytypefilter: _model.choiceChipsValue1,
                          ));
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue1 != null,
                        alignment: WrapAlignment.center,
                        controller: _model.choiceChipsValueController1 ??=
                            FormFieldController<List<String>>(
                          [
                            valueOrDefault(
                                currentUserDocument?.startupindustrytypefilter,
                                '')
                          ],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 40.0, 0.0, 0.0),
                          child: Text(
                            'Start-up looking for filter',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowChoiceChips(
                        options: const [
                          ChipData('All'),
                          ChipData('Advisor'),
                          ChipData('CTO'),
                          ChipData('CEO'),
                          ChipData('CMO'),
                          ChipData('Investor')
                        ],
                        onChanged: (val) async {
                          setState(() =>
                              _model.choiceChipsValue2 = val?.firstOrNull);
                          logFirebaseEvent(
                              'STARTUPFILTER_ChoiceChips_b9jvgg3b_ON_FO');
                          logFirebaseEvent('ChoiceChips_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            startuplookingforfilter: _model.choiceChipsValue2,
                          ));
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue2 != null,
                        alignment: WrapAlignment.center,
                        controller: _model.choiceChipsValueController2 ??=
                            FormFieldController<List<String>>(
                          [
                            valueOrDefault(
                                currentUserDocument?.startuplookingforfilter,
                                '')
                          ],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('STARTUPFILTER_PAGE_SAVE_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'startUpPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ],
              ),
            ),
          ),
        ));
  }
}

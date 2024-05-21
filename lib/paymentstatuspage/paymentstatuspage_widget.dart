import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'paymentstatuspage_model.dart';
export 'paymentstatuspage_model.dart';

class PaymentstatuspageWidget extends StatefulWidget {
  const PaymentstatuspageWidget({
    super.key,
    required this.authId,
  });

  final String? authId;

  @override
  State<PaymentstatuspageWidget> createState() =>
      _PaymentstatuspageWidgetState();
}

class _PaymentstatuspageWidgetState extends State<PaymentstatuspageWidget> {
  late PaymentstatuspageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentstatuspageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'paymentstatuspage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PAYMENTSTATUSpaymentstatuspage_ON_INIT_S');
      logFirebaseEvent('paymentstatuspage_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('paymentstatuspage_custom_action');
      _model.xVerifystatusauth = await actions.sha256authstatus(
        'PGTESTPAYUAT',
        widget.authId!,
      );
      logFirebaseEvent('paymentstatuspage_backend_call');
      _model.apiResult7vx = await AuthrequeststatusCall.call(
        merchantId: 'PGTESTPAYUAT',
        authRequestId: widget.authId,
        xVerify: _model.xVerifystatusauth,
      );
      logFirebaseEvent('paymentstatuspage_update_page_state');
      setState(() {
        _model.status = AuthrequeststatusCall.transactionstate(
          (_model.apiResult7vx?.jsonBody ?? ''),
        )!;
      });
      while (_model.status == 'PENDING') {
        logFirebaseEvent('paymentstatuspage_backend_call');
        _model.apiResult7v = await AuthrequeststatusCall.call(
          merchantId: 'PGTESTPAYUAT',
          authRequestId: widget.authId,
          xVerify: _model.xVerifystatusauth,
        );
        logFirebaseEvent('paymentstatuspage_update_page_state');
        setState(() {
          _model.status = AuthrequeststatusCall.transactionstate(
            (_model.apiResult7v?.jsonBody ?? ''),
          )!;
        });
      }
      if (_model.status == 'COMPLETED') {
        logFirebaseEvent('paymentstatuspage_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          iseliteuser: true,
        ));
        logFirebaseEvent('paymentstatuspage_navigate_to');

        context.goNamed('paymentsuccess');
      }
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
    return Title(
        title: 'paymentstatuspage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Checking payment status',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Waiting for the payment!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'To confirm the payment status tab below!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Payment status',
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

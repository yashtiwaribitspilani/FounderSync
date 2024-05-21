import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'helppage_model.dart';
export 'helppage_model.dart';

class HelppageWidget extends StatefulWidget {
  const HelppageWidget({super.key});

  @override
  State<HelppageWidget> createState() => _HelppageWidgetState();
}

class _HelppageWidgetState extends State<HelppageWidget> {
  late HelppageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelppageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'helppage'});
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
        title: 'helppage',
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
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('HELParrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Refund Policy',
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Refund Policy for FounderSync\n\nEffective Date: 24/03/2024\n\nThank you for choosing FounderSync. We value your satisfaction and strive to provide you with the best experience possible. Please read our refund policy carefully before making any purchase within the FounderSync app.\n\nRefund Eligibility:\n\nRefunds may be granted under the following circumstances:\nUnauthorized Purchase: If you believe a purchase was made without your consent, please contact us immediately for a refund.\nTechnical Issues: If you encounter technical issues preventing you from using the purchased features/content, you may be eligible for a refund. Please provide detailed information about the problem.\nDissatisfaction: If you are dissatisfied with your purchase for any reason, you may request a refund within 3 days of the purchase date.\nRefunds will not be provided for reasons other than those mentioned above.\n\nRefund Process:\n\nTo request a refund, please contact our customer support team at [support email] with the following information:\nYour name\nDate of purchase\nTransaction ID or receipt number\nReason for the refund request\nWe aim to process refund requests within 7 business days\n\nRefund Methods:\n\nRefunds will be issued through the same payment method used for the original purchase.\nPlease note that processing times for refunds may vary depending on your payment provider.\n\nNon-Refundable Items:\n\nCertain items within the app may be labeled as non-refundable. These include, but are not limited to, consumable in-app purchases and services that have been fully rendered.\n\nSubscription Refunds:\n\nSubscriptions are subject to the terms outlined in the subscription agreement. Refunds for subscriptions will be handled in accordance with the terms of the agreement.\n\nPolicy Changes:\n\nWe reserve the right to modify or amend this refund policy at any time. Any changes will be effective immediately upon posting the updated policy within the app.\n\nContact Us:\n\nIf you have any questions or concerns about our refund policy, please contact us at  https://globocom.info/\nBy using the FounderSync app and making purchases within it, you agree to abide by this refund policy. We appreciate your understanding and cooperation.\n\nFounderSync Team\n\n\n\n\n\n',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
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

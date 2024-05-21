import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paymentstatuspage_widget.dart' show PaymentstatuspageWidget;
import 'package:flutter/material.dart';

class PaymentstatuspageModel extends FlutterFlowModel<PaymentstatuspageWidget> {
  ///  Local state fields for this page.

  String status = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - sha256authstatus] action in paymentstatuspage widget.
  String? xVerifystatusauth;
  // Stores action output result for [Backend Call - API (authrequeststatus)] action in paymentstatuspage widget.
  ApiCallResponse? apiResult7vx;
  // Stores action output result for [Backend Call - API (authrequeststatus)] action in paymentstatuspage widget.
  ApiCallResponse? apiResult7v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/pages/popupmonthly/popupmonthly_widget.dart';
import '/pages/popupyearly/popupyearly_widget.dart';
import 'tabarpoppayment_widget.dart' show TabarpoppaymentWidget;
import 'package:flutter/material.dart';

class TabarpoppaymentModel extends FlutterFlowModel<TabarpoppaymentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for popupmonthly component.
  late PopupmonthlyModel popupmonthlyModel;
  // Model for popupyearly component.
  late PopupyearlyModel popupyearlyModel;

  @override
  void initState(BuildContext context) {
    popupmonthlyModel = createModel(context, () => PopupmonthlyModel());
    popupyearlyModel = createModel(context, () => PopupyearlyModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    popupmonthlyModel.dispose();
    popupyearlyModel.dispose();
  }
}

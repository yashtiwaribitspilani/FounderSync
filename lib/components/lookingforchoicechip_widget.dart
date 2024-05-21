import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'lookingforchoicechip_model.dart';
export 'lookingforchoicechip_model.dart';

class LookingforchoicechipWidget extends StatefulWidget {
  const LookingforchoicechipWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  State<LookingforchoicechipWidget> createState() =>
      _LookingforchoicechipWidgetState();
}

class _LookingforchoicechipWidgetState
    extends State<LookingforchoicechipWidget> {
  late LookingforchoicechipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LookingforchoicechipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: widget.parameter1!.map((label) => ChipData(label)).toList(),
      onChanged: (val) =>
          setState(() => _model.choiceChipsValue = val?.firstOrNull),
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 16.0,
        elevation: 4.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: 'Readex Pro',
              fontSize: 12.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      chipSpacing: 10.0,
      rowSpacing: 12.0,
      multiselect: false,
      alignment: WrapAlignment.center,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      wrapped: false,
    );
  }
}

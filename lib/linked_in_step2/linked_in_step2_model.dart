import '/backend/api_requests/api_calls.dart';
import '/components/linked_ineditable_tabbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linked_in_step2_widget.dart' show LinkedInStep2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LinkedInStep2Model extends FlutterFlowModel<LinkedInStep2Widget> {
  ///  Local state fields for this page.

  String? id;

  int low = 0;

  int? high;

  int lowc = 0;

  int? highc;

  bool isloading = false;

  bool ispopupopen = false;

  bool initialfetchloading = false;

  String? initialphoto;

  String? initialname;

  String? initialdescription;

  String? initialcity;

  String? initialstate;

  String initialemail = '';

  String fetch = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for LinkedIneditableTabbar component.
  late LinkedIneditableTabbarModel linkedIneditableTabbarModel;
  // Stores action output result for [Backend Call - API (linkedin)] action in Button widget.
  ApiCallResponse? apiResult71r;
  // Stores action output result for [Backend Call - API (emailfetcher)] action in Button widget.
  ApiCallResponse? apiResult098;
  // Stores action output result for [Custom Action - companynamereturner] action in Container widget.
  String? companyname;
  // Stores action output result for [Custom Action - rolereturner] action in Container widget.
  String? role;
  // Stores action output result for [Custom Action - descriptionreturner] action in Container widget.
  String? description;
  // Stores action output result for [Custom Action - startdate] action in Container widget.
  DateTime? startdate;
  // Stores action output result for [Custom Action - enddate] action in Container widget.
  DateTime? enddate;
  // Stores action output result for [Custom Action - collegenamereturner] action in Container widget.
  String? collegename;
  // Stores action output result for [Custom Action - degreenamereturner] action in Container widget.
  String? degreename;
  // Stores action output result for [Custom Action - branchnamereturner] action in Container widget.
  String? branchname;
  // Stores action output result for [Custom Action - collegestartdate] action in Container widget.
  int? collegestartdate;
  // Stores action output result for [Custom Action - collegeenddate] action in Container widget.
  int? collegeenddate;
  // Stores action output result for [Custom Action - companynamereturner] action in Container widget.
  String? companyname2;
  // Stores action output result for [Custom Action - rolereturner] action in Container widget.
  String? role2;
  // Stores action output result for [Custom Action - descriptionreturner] action in Container widget.
  String? description2;
  // Stores action output result for [Custom Action - startdate] action in Container widget.
  DateTime? startdate2;
  // Stores action output result for [Custom Action - enddate] action in Container widget.
  DateTime? enddate2;
  // Stores action output result for [Custom Action - collegenamereturner] action in Container widget.
  String? collegename2;
  // Stores action output result for [Custom Action - degreenamereturner] action in Container widget.
  String? degreename2;
  // Stores action output result for [Custom Action - branchnamereturner] action in Container widget.
  String? branchname2;
  // Stores action output result for [Custom Action - collegestartdate] action in Container widget.
  int? collegestartdate2;
  // Stores action output result for [Custom Action - collegeenddate] action in Container widget.
  int? collegeenddate2;

  @override
  void initState(BuildContext context) {
    linkedIneditableTabbarModel =
        createModel(context, () => LinkedIneditableTabbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    linkedIneditableTabbarModel.dispose();
  }
}

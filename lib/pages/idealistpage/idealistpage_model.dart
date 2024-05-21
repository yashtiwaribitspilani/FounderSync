import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'idealistpage_widget.dart' show IdealistpageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IdealistpageModel extends FlutterFlowModel<IdealistpageWidget> {
  ///  Local state fields for this page.

  bool statechange = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for TabBarmain widget.
  TabController? tabBarmainController;
  int get tabBarmainCurrentIndex =>
      tabBarmainController != null ? tabBarmainController!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarmainController?.dispose();
    tabBarController1?.dispose();
    tabBarController2?.dispose();
    navBar1Model.dispose();
  }
}

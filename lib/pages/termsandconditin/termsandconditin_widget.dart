import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'termsandconditin_model.dart';
export 'termsandconditin_model.dart';

class TermsandconditinWidget extends StatefulWidget {
  const TermsandconditinWidget({super.key});

  @override
  State<TermsandconditinWidget> createState() => _TermsandconditinWidgetState();
}

class _TermsandconditinWidgetState extends State<TermsandconditinWidget> {
  late TermsandconditinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandconditinModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'termsandconditin'});
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
        title: 'termsandconditin',
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
                  logFirebaseEvent('TERMSANDCONDITIN_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Terms and Conditions',
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
                        'FounderSync App - Terms and Conditions\n\nEffective Date: 24/03/2024\n\nWelcome to FounderSync! These Terms and Conditions (\"Terms\") govern your access to and use of the FounderSync mobile application (the \"App\") provided by FounderSync Inc. (\"FounderSync,\" \"we,\" \"us,\" or \"our\"). By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, please do not access or use the App.\n\nUse of the App:\n\nThe App is intended for individuals interested in networking with potential co-founders, advisors, or collaborators for startup ventures.\nYou must be at least 18 years old to use the App.\nUser Accounts:\n\nYou may be required to create a user account to access certain features of the App.\nYou agree to provide accurate, current, and complete information during the registration process.\nYou are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.\nUser Content:\n\nYou retain ownership of any content, including messages, profiles, and information (\"User Content\"), that you submit or upload to the App.\nBy submitting User Content, you grant FounderSync a non-exclusive, worldwide, royalty-free, perpetual, irrevocable, sublicenseable, and transferable license to use, reproduce, modify, adapt, publish, translate, distribute, and display such User Content in connection with the operation of the App.\nYou represent and warrant that you have all necessary rights to grant the above license regarding the User Content you submit.\nProhibited Conduct:\n\nYou agree not to engage in any conduct that:\nViolates these Terms or any applicable laws or regulations.\nInfringes upon the rights of others, including intellectual property rights.\nHarasses, threatens, or harms other users.\nAttempts to gain unauthorized access to the App or any other user accounts.\nFounderSync reserves the right to suspend or terminate your account and access to the App if you violate these Terms.\nIntellectual Property:\n\nThe App and its content, including but not limited to text, graphics, logos, images, and software, are the property of FounderSync and are protected by copyright and other intellectual property laws.\nDisclaimer of Warranties:\n\nThe App is provided on an \"as is\" and \"as available\" basis, without any warranties of any kind, express or implied.\nFounderSync does not warrant that the App will be uninterrupted, error-free, or free of harmful components.\nLimitation of Liability:\n\nFounderSync shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or relating to your use of the App.\nChanges to the Terms:\n\nFounderSync reserves the right to modify or update these Terms at any time. Any changes will be effective immediately upon posting the updated Terms within the App.\nGoverning Law:\n\nThese Terms shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law principles.\nContact Us:\n\nIf you have any questions or concerns about these Terms, please contact us at https://globocom.info/.\nBy accessing or using the FounderSync App, you agree to be bound by these Terms and any updates or modifications thereto. Thank you for using FounderSync!\n\nFuturatech platform pvt ltd\n\n\n\n\n\n',
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

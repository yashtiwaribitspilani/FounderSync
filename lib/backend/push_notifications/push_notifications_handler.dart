import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? const Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF0077B5),
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'people': ParameterData.none(),
  'likes': ParameterData.none(),
  'createpage': ParameterData.none(),
  'simplifiedProfile': (data) async => ParameterData(
        allParams: {
          'userDocument': await getDocumentParameter<UsersRecord>(
              data, 'userDocument', UsersRecord.fromSnapshot),
        },
      ),
  'chatRoom': ParameterData.none(),
  'chatConversation': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'id2': getParameter<String>(data, 'id2'),
          'user2': getParameter<DocumentReference>(data, 'user2'),
          'userImage': getParameter<String>(data, 'userImage'),
          'user2doc': await getDocumentParameter<UsersRecord>(
              data, 'user2doc', UsersRecord.fromSnapshot),
          'welikedocvieweruser':
              await getDocumentParameter<WeLikeEachOtherRecord>(data,
                  'welikedocvieweruser', WeLikeEachOtherRecord.fromSnapshot),
        },
      ),
  'Login2': ParameterData.none(),
  'CreateAccount2': ParameterData.none(),
  'ForgotPassword01': ParameterData.none(),
  'profile12': ParameterData.none(),
  'settings': ParameterData.none(),
  'onetime_profilePicture': ParameterData.none(),
  'onetime_name': ParameterData.none(),
  'add_work': ParameterData.none(),
  'add_education': ParameterData.none(),
  'onetimeuser_information': ParameterData.none(),
  'filters': ParameterData.none(),
  'setting': ParameterData.none(),
  'postanidea1': ParameterData.none(),
  'postanidea2': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
        },
      ),
  'postanidea3': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
        },
      ),
  'postanidea4': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
        },
      ),
  'idealistpage': ParameterData.none(),
  'newhcat': ParameterData.none(),
  'ideadisplaypage': (data) async => ParameterData(
        allParams: {
          'ideadoc': await getDocumentParameter<IdeaRecord>(
              data, 'ideadoc', IdeaRecord.fromSnapshot),
        },
      ),
  'ideaflowdecider': ParameterData.none(),
  'startup_information_capture': ParameterData.none(),
  'viewprofile': (data) async => ParameterData(
        allParams: {
          'userdoc': await getDocumentParameter<UsersRecord>(
              data, 'userdoc', UsersRecord.fromSnapshot),
        },
      ),
  'privacypage': ParameterData.none(),
  'ideaPage': ParameterData.none(),
  'helppage': ParameterData.none(),
  'termsandconditin': ParameterData.none(),
  'postanidea1Copy': (data) async => ParameterData(
        allParams: {
          'ideadoc': await getDocumentParameter<IdeaRecord>(
              data, 'ideadoc', IdeaRecord.fromSnapshot),
        },
      ),
  'postanidea2Copy': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
          'ideadoc': await getDocumentParameter<IdeaRecord>(
              data, 'ideadoc', IdeaRecord.fromSnapshot),
        },
      ),
  'postanidea3Copy': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
          'ideadoc': await getDocumentParameter<IdeaRecord>(
              data, 'ideadoc', IdeaRecord.fromSnapshot),
        },
      ),
  'postanidea4Copy': (data) async => ParameterData(
        allParams: {
          'idearef': getParameter<DocumentReference>(data, 'idearef'),
        },
      ),
  'paymentstatuspage': (data) async => ParameterData(
        allParams: {
          'authId': getParameter<String>(data, 'authId'),
        },
      ),
  'paymentsuccess': ParameterData.none(),
  'Login2Copy': ParameterData.none(),
  'testpage': ParameterData.none(),
  'linkedIn': ParameterData.none(),
  'startUpPage': ParameterData.none(),
  'peopleUndopage': (data) async => ParameterData(
        allParams: {
          'userref': getParameter<DocumentReference>(data, 'userref'),
        },
      ),
  'chatRoomSearch': ParameterData.none(),
  'linkedInPopUp': ParameterData.none(),
  'startUpdisplaypage': (data) async => ParameterData(
        allParams: {
          'startupdoc': await getDocumentParameter<StartupRecord>(
              data, 'startupdoc', StartupRecord.fromSnapshot),
        },
      ),
  'Ideaundopage': (data) async => ParameterData(
        allParams: {
          'ideadoc': getParameter<DocumentReference>(data, 'ideadoc'),
        },
      ),
  'startupfilter': ParameterData.none(),
  'profileEditPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

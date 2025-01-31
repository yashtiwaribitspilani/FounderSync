import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const PeopleWidget() : const Login2Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const PeopleWidget() : const Login2Widget(),
        ),
        FFRoute(
          name: 'people',
          path: '/people',
          builder: (context, params) => const PeopleWidget(),
        ),
        FFRoute(
          name: 'likes',
          path: '/likes',
          builder: (context, params) => const LikesWidget(),
        ),
        FFRoute(
          name: 'createpage',
          path: '/createpage',
          builder: (context, params) => const CreatepageWidget(),
        ),
        FFRoute(
          name: 'simplifiedProfile',
          path: '/simplifiedProfile',
          asyncParams: {
            'userDocument': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => SimplifiedProfileWidget(
            userDocument: params.getParam(
              'userDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chatRoom',
          path: '/chatRoom',
          builder: (context, params) => const ChatRoomWidget(),
        ),
        FFRoute(
          name: 'chatConversation',
          path: '/chatConversation',
          requireAuth: true,
          asyncParams: {
            'user2doc': getDoc(['users'], UsersRecord.fromSnapshot),
            'welikedocvieweruser': getDoc(['users', 'weLikeEachOther'],
                WeLikeEachOtherRecord.fromSnapshot),
          },
          builder: (context, params) => ChatConversationWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            id2: params.getParam(
              'id2',
              ParamType.String,
            ),
            user2: params.getParam(
              'user2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            userImage: params.getParam(
              'userImage',
              ParamType.String,
            ),
            user2doc: params.getParam(
              'user2doc',
              ParamType.Document,
            ),
            welikedocvieweruser: params.getParam(
              'welikedocvieweruser',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Login2',
          path: '/login2',
          builder: (context, params) => const Login2Widget(),
        ),
        FFRoute(
          name: 'CreateAccount2',
          path: '/createAccount2',
          builder: (context, params) => const CreateAccount2Widget(),
        ),
        FFRoute(
          name: 'ForgotPassword01',
          path: '/forgotPassword01',
          builder: (context, params) => const ForgotPassword01Widget(),
        ),
        FFRoute(
          name: 'profile12',
          path: '/profile12',
          builder: (context, params) => const Profile12Widget(),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'onetime_profilePicture',
          path: '/onetimeProfilePicture',
          builder: (context, params) => const OnetimeProfilePictureWidget(),
        ),
        FFRoute(
          name: 'onetime_name',
          path: '/onetimeName',
          builder: (context, params) => const OnetimeNameWidget(),
        ),
        FFRoute(
          name: 'add_work',
          path: '/addWork',
          builder: (context, params) => const AddWorkWidget(),
        ),
        FFRoute(
          name: 'add_education',
          path: '/addEducation',
          builder: (context, params) => const AddEducationWidget(),
        ),
        FFRoute(
          name: 'onetimeuser_information',
          path: '/onetimeuserInformation',
          builder: (context, params) => const OnetimeuserInformationWidget(),
        ),
        FFRoute(
          name: 'filters',
          path: '/filters',
          builder: (context, params) => const FiltersWidget(),
        ),
        FFRoute(
          name: 'setting',
          path: '/setting',
          builder: (context, params) => const SettingWidget(),
        ),
        FFRoute(
          name: 'postanidea1',
          path: '/postanidea1',
          builder: (context, params) => const Postanidea1Widget(),
        ),
        FFRoute(
          name: 'postanidea2',
          path: '/postanidea2',
          builder: (context, params) => Postanidea2Widget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
          ),
        ),
        FFRoute(
          name: 'postanidea3',
          path: '/postanidea3',
          builder: (context, params) => Postanidea3Widget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
          ),
        ),
        FFRoute(
          name: 'postanidea4',
          path: '/postanidea4',
          builder: (context, params) => Postanidea4Widget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
          ),
        ),
        FFRoute(
          name: 'idealistpage',
          path: '/idealistpage',
          builder: (context, params) => const IdealistpageWidget(),
        ),
        FFRoute(
          name: 'newhcat',
          path: '/newhcat',
          builder: (context, params) => const NewhcatWidget(),
        ),
        FFRoute(
          name: 'ideadisplaypage',
          path: '/ideadisplaypage',
          asyncParams: {
            'ideadoc': getDoc(['idea'], IdeaRecord.fromSnapshot),
          },
          builder: (context, params) => IdeadisplaypageWidget(
            ideadoc: params.getParam(
              'ideadoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ideaflowdecider',
          path: '/ideaflowdecider',
          builder: (context, params) => const IdeaflowdeciderWidget(),
        ),
        FFRoute(
          name: 'startup_information_capture',
          path: '/startupInformationCapture',
          builder: (context, params) => const StartupInformationCaptureWidget(),
        ),
        FFRoute(
          name: 'viewprofile',
          path: '/viewprofile',
          asyncParams: {
            'userdoc': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ViewprofileWidget(
            userdoc: params.getParam(
              'userdoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'privacypage',
          path: '/privacypage',
          builder: (context, params) => const PrivacypageWidget(),
        ),
        FFRoute(
          name: 'ideaPage',
          path: '/swipe',
          builder: (context, params) => const IdeaPageWidget(),
        ),
        FFRoute(
          name: 'helppage',
          path: '/helppage',
          builder: (context, params) => const HelppageWidget(),
        ),
        FFRoute(
          name: 'termsandconditin',
          path: '/termsandconditin',
          builder: (context, params) => const TermsandconditinWidget(),
        ),
        FFRoute(
          name: 'postanidea1Copy',
          path: '/postanidea1Copy',
          asyncParams: {
            'ideadoc': getDoc(['idea'], IdeaRecord.fromSnapshot),
          },
          builder: (context, params) => Postanidea1CopyWidget(
            ideadoc: params.getParam(
              'ideadoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'postanidea2Copy',
          path: '/postanidea2Copy',
          asyncParams: {
            'ideadoc': getDoc(['idea'], IdeaRecord.fromSnapshot),
          },
          builder: (context, params) => Postanidea2CopyWidget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
            ideadoc: params.getParam(
              'ideadoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'postanidea3Copy',
          path: '/postanidea3Copy',
          asyncParams: {
            'ideadoc': getDoc(['idea'], IdeaRecord.fromSnapshot),
          },
          builder: (context, params) => Postanidea3CopyWidget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
            ideadoc: params.getParam(
              'ideadoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'postanidea4Copy',
          path: '/postanidea4Copy',
          builder: (context, params) => Postanidea4CopyWidget(
            idearef: params.getParam(
              'idearef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
          ),
        ),
        FFRoute(
          name: 'paymentstatuspage',
          path: '/paymentstatuspage',
          builder: (context, params) => PaymentstatuspageWidget(
            authId: params.getParam(
              'authId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'paymentsuccess',
          path: '/paymentsuccess',
          builder: (context, params) => const PaymentsuccessWidget(),
        ),
        FFRoute(
          name: 'Login2Copy',
          path: '/login2testing',
          builder: (context, params) => const Login2CopyWidget(),
        ),
        FFRoute(
          name: 'testpage',
          path: '/testpage',
          builder: (context, params) => const TestpageWidget(),
        ),
        FFRoute(
          name: 'linkedIn',
          path: '/linkedIn',
          builder: (context, params) => const LinkedInWidget(),
        ),
        FFRoute(
          name: 'startUpPage',
          path: '/startUpPage',
          builder: (context, params) => const StartUpPageWidget(),
        ),
        FFRoute(
          name: 'peopleUndopage',
          path: '/peopleUndopage',
          builder: (context, params) => PeopleUndopageWidget(
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'chatRoomSearch',
          path: '/chatRoomSearch',
          builder: (context, params) => const ChatRoomSearchWidget(),
        ),
        FFRoute(
          name: 'linkedInPopUp',
          path: '/linkedInPopUp',
          builder: (context, params) => const LinkedInPopUpWidget(),
        ),
        FFRoute(
          name: 'startUpdisplaypage',
          path: '/startUpdisplaypage',
          asyncParams: {
            'startupdoc': getDoc(['startup'], StartupRecord.fromSnapshot),
          },
          builder: (context, params) => StartUpdisplaypageWidget(
            startupdoc: params.getParam(
              'startupdoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Ideaundopage',
          path: '/swipe2',
          builder: (context, params) => IdeaundopageWidget(
            ideadoc: params.getParam(
              'ideadoc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['idea'],
            ),
          ),
        ),
        FFRoute(
          name: 'startupfilter',
          path: '/startupfilter',
          builder: (context, params) => const StartupfilterWidget(),
        ),
        FFRoute(
          name: 'profileEditPage',
          path: '/profileEditPage',
          builder: (context, params) => const ProfileEditPageWidget(),
        ),
        FFRoute(
          name: 'Step1',
          path: '/step1',
          builder: (context, params) => const Step1Widget(),
        ),
        FFRoute(
          name: 'linkedInStep2',
          path: '/linkedInStep2',
          builder: (context, params) => const LinkedInStep2Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login2';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

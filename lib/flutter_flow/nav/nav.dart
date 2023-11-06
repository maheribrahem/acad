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
          appStateNotifier.loggedIn ? const ProfileWidget() : const AuthoWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const ProfileWidget() : const AuthoWidget(),
        ),
        FFRoute(
          name: 'autho',
          path: '/autho',
          builder: (context, params) => const AuthoWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(
            oldV: params.getParam('oldV', ParamType.String),
            newV: params.getParam(
                'newV', ParamType.DocumentReference, false, ['version']),
          ),
        ),
        FFRoute(
          name: 'lessonContent',
          path: '/lessonContent',
          requireAuth: true,
          builder: (context, params) => LessonContentWidget(
            activiRef: params.getParam('activiRef', ParamType.DocumentReference,
                false, ['activities']),
            lessonsCount: params.getParam<DocumentReference>('lessonsCount',
                ParamType.DocumentReference, true, ['activities']),
          ),
        ),
        FFRoute(
          name: 'phone',
          path: '/phone',
          builder: (context, params) => const PhoneWidget(),
        ),
        FFRoute(
          name: 'templet',
          path: '/templet',
          requireAuth: true,
          builder: (context, params) => TempletWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'coursesMainP',
          path: '/coursesMainP',
          requireAuth: true,
          builder: (context, params) => CoursesMainPWidget(
            output: params.getParam('output', ParamType.bool),
            supjRef: params.getParam(
                'supjRef', ParamType.DocumentReference, false, ['supj']),
            categRef: params.getParam(
                'categRef', ParamType.DocumentReference, false, ['categ']),
          ),
        ),
        FFRoute(
          name: 'homePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => HomePageWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'profilecom',
          path: '/profilecom',
          requireAuth: true,
          builder: (context, params) => const ProfilecomWidget(),
        ),
        FFRoute(
          name: 'admin',
          path: '/admin',
          requireAuth: true,
          builder: (context, params) => AdminWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'supadmin',
          path: '/supadmin',
          requireAuth: true,
          builder: (context, params) => SupadminWidget(
            output: params.getParam('output', ParamType.bool),
            filter: params.getParam('filter', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'mentor',
          path: '/mentor',
          requireAuth: true,
          builder: (context, params) => MentorWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'admincourses',
          path: '/admincourses',
          requireAuth: true,
          builder: (context, params) => AdmincoursesWidget(
            output: params.getParam('output', ParamType.bool),
            num: params.getParam('num', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'courseContent',
          path: '/courseContent',
          requireAuth: true,
          builder: (context, params) => CourseContentWidget(
            output: params.getParam('output', ParamType.bool),
            courseRef: params.getParam(
                'courseRef', ParamType.DocumentReference, false, ['supj']),
          ),
        ),
        FFRoute(
          name: 'adminUsesrs',
          path: '/adminUsesrs',
          requireAuth: true,
          builder: (context, params) => AdminUsesrsWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'adminSupj',
          path: '/adminSupj',
          requireAuth: true,
          builder: (context, params) => AdminSupjWidget(
            output: params.getParam('output', ParamType.bool),
            supjRef: params.getParam(
                'supjRef', ParamType.DocumentReference, false, ['supj']),
          ),
        ),
        FFRoute(
          name: 'usersReports',
          path: '/usersReports',
          requireAuth: true,
          builder: (context, params) => UsersReportsWidget(
            inspection: params.getParam(
                'inspection', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'adminSupjTest',
          path: '/adminSupjTest',
          requireAuth: true,
          builder: (context, params) => AdminSupjTestWidget(
            output: params.getParam('output', ParamType.bool),
            activRef: params.getParam(
                'activRef', ParamType.DocumentReference, false, ['activities']),
          ),
        ),
        FFRoute(
          name: 'graduation',
          path: '/graduation',
          requireAuth: true,
          builder: (context, params) => GraduationWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'supadminUsers',
          path: '/supadminUsers',
          requireAuth: true,
          builder: (context, params) => SupadminUsersWidget(
            output: params.getParam('output', ParamType.bool),
            filter: params.getParam('filter', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'adminCohorts',
          path: '/adminCohorts',
          requireAuth: true,
          builder: (context, params) => AdminCohortsWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'mentorAdmin',
          path: '/mentorAdmin',
          requireAuth: true,
          builder: (context, params) => MentorAdminWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'cohortsPage',
          path: '/cohortsPage',
          requireAuth: true,
          builder: (context, params) => CohortsPageWidget(
            cohortsRef: params.getParam(
                'cohortsRef', ParamType.DocumentReference, false, ['cohorts']),
          ),
        ),
        FFRoute(
          name: 'privacyAndPolicy',
          path: '/privacyAndPolicy',
          builder: (context, params) => const PrivacyAndPolicyWidget(),
        ),
        FFRoute(
          name: 'supadminGrades',
          path: '/supadminGrades',
          requireAuth: true,
          builder: (context, params) => SupadminGradesWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'supadminGrading',
          path: '/supadminGrading',
          requireAuth: true,
          builder: (context, params) => SupadminGradingWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'supadminquran',
          path: '/supadminquran',
          requireAuth: true,
          builder: (context, params) => const SupadminquranWidget(),
        ),
        FFRoute(
          name: 'testContent',
          path: '/testContent',
          requireAuth: true,
          builder: (context, params) => TestContentWidget(
            testRef: params.getParam(
                'testRef', ParamType.DocumentReference, false, ['activities']),
          ),
        ),
        FFRoute(
          name: 'adminCopy',
          path: '/adminCopy',
          requireAuth: true,
          builder: (context, params) => AdminCopyWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'adminCopyCopy',
          path: '/adminCopyCopy',
          requireAuth: true,
          builder: (context, params) => AdminCopyCopyWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'adminUsesrsCopy',
          path: '/adminUsesrsCopy',
          requireAuth: true,
          builder: (context, params) => AdminUsesrsCopyWidget(
            output: params.getParam('output', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'profileCopy',
          path: '/profileCopy',
          requireAuth: true,
          builder: (context, params) => ProfileCopyWidget(
            oldV: params.getParam('oldV', ParamType.String),
            newV: params.getParam(
                'newV', ParamType.DocumentReference, false, ['version']),
          ),
        ),
        FFRoute(
          name: 'courseContentCopy',
          path: '/courseContentCopy',
          requireAuth: true,
          builder: (context, params) => CourseContentCopyWidget(
            output: params.getParam('output', ParamType.bool),
            courseRef: params.getParam(
                'courseRef', ParamType.DocumentReference, false, ['supj']),
          ),
        ),
        FFRoute(
          name: 'lessonContentCopy',
          path: '/lessonContentCopy',
          requireAuth: true,
          builder: (context, params) => LessonContentCopyWidget(
            activiRef: params.getParam('activiRef', ParamType.DocumentReference,
                false, ['activities']),
            lessonsCount: params.getParam<DocumentReference>('lessonsCount',
                ParamType.DocumentReference, true, ['activities']),
          ),
        ),
        FFRoute(
          name: 'usersReportsCopy',
          path: '/usersReportsCopy',
          requireAuth: true,
          builder: (context, params) => const UsersReportsCopyWidget(),
        ),
        FFRoute(
          name: 'supadminGradesCopy',
          path: '/supadminGradesCopy',
          requireAuth: true,
          builder: (context, params) => SupadminGradesCopyWidget(
            output: params.getParam('output', ParamType.bool),
          ),
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/autho';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/intro0.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

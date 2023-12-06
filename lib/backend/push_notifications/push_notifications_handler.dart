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
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/intro0.gif',
            fit: BoxFit.cover,
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
  'autho': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'profile': (data) async => ParameterData(
        allParams: {
          'oldV': getParameter<String>(data, 'oldV'),
          'newV': getParameter<DocumentReference>(data, 'newV'),
        },
      ),
  'lessonContentCopy1': (data) async => ParameterData(
        allParams: {
          'activiRef': getParameter<DocumentReference>(data, 'activiRef'),
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
        },
      ),
  'phone': ParameterData.none(),
  'templet': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'coursesMainP': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'supjRef': getParameter<DocumentReference>(data, 'supjRef'),
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
        },
      ),
  'home': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'profilecom': ParameterData.none(),
  'admin': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'supadmin': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'filter': getParameter<String>(data, 'filter'),
        },
      ),
  'mentor': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'admincourses': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'num': getParameter<int>(data, 'num'),
        },
      ),
  'courseContent': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'courseRef': getParameter<DocumentReference>(data, 'courseRef'),
        },
      ),
  'adminUsesrs': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'adminSupj': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'supjRef': getParameter<DocumentReference>(data, 'supjRef'),
        },
      ),
  'usersReports': (data) async => ParameterData(
        allParams: {
          'inspection': getParameter<DocumentReference>(data, 'inspection'),
          'reCalculate': getParameter<bool>(data, 'reCalculate'),
          'categRefCalculate':
              getParameter<DocumentReference>(data, 'categRefCalculate'),
        },
      ),
  'adminSupjTest': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'activRef': getParameter<DocumentReference>(data, 'activRef'),
        },
      ),
  'graduation': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'supadminUsersCopy4': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'filter': getParameter<String>(data, 'filter'),
        },
      ),
  'adminCohorts': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'mentorAdmin': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'cohortsPage': (data) async => ParameterData(
        allParams: {
          'cohortsRef': getParameter<DocumentReference>(data, 'cohortsRef'),
        },
      ),
  'privacyAndPolicy': ParameterData.none(),
  'supadminGrades': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'supadminGrading': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'supadminquran': ParameterData.none(),
  'testContent': (data) async => ParameterData(
        allParams: {
          'testRef': getParameter<DocumentReference>(data, 'testRef'),
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
        },
      ),
  'adminCopy': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'adminCopyCopy': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'adminUsesrsCopy': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'profileCopy': (data) async => ParameterData(
        allParams: {
          'oldV': getParameter<String>(data, 'oldV'),
          'newV': getParameter<DocumentReference>(data, 'newV'),
        },
      ),
  'courseContentCopy': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'courseRef': getParameter<DocumentReference>(data, 'courseRef'),
        },
      ),
  'lessonContentCopy': (data) async => ParameterData(
        allParams: {
          'activiRef': getParameter<DocumentReference>(data, 'activiRef'),
        },
      ),
  'supadminGradesCopy': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
        },
      ),
  'reportMaker': (data) async => ParameterData(
        allParams: {
          'inspection': getParameter<DocumentReference>(data, 'inspection'),
        },
      ),
  'supadminUsers': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'filter': getParameter<String>(data, 'filter'),
        },
      ),
  'supadminUsersCopy2': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'filter': getParameter<String>(data, 'filter'),
        },
      ),
  'cohortsPageCopy': (data) async => ParameterData(
        allParams: {
          'cohortsRef': getParameter<DocumentReference>(data, 'cohortsRef'),
        },
      ),
  'supadminUsersCopy3': (data) async => ParameterData(
        allParams: {
          'output': getParameter<bool>(data, 'output'),
          'filter': getParameter<String>(data, 'filter'),
        },
      ),
  'homePage': ParameterData.none(),
  'lessonContent': (data) async => ParameterData(
        allParams: {
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
          'activitREF': getParameter<DocumentReference>(data, 'activitREF'),
          'supjREF': getParameter<DocumentReference>(data, 'supjREF'),
        },
      ),
  'lessonContentCopy0': (data) async => ParameterData(
        allParams: {
          'activiRef': getParameter<DocumentReference>(data, 'activiRef'),
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
        },
      ),
  'testContentCopy': (data) async => ParameterData(
        allParams: {
          'testRef': getParameter<DocumentReference>(data, 'testRef'),
          'categRef': getParameter<DocumentReference>(data, 'categRef'),
        },
      ),
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

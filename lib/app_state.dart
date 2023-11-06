import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _oldV = '1';
  String get oldV => _oldV;
  set oldV(String value) {
    _oldV = value;
  }

  DocumentReference? _newV =
      FirebaseFirestore.instance.doc('/version/31WZaqYs4oObBl9qto2k');
  DocumentReference? get newV => _newV;
  set newV(DocumentReference? value) {
    _newV = value;
  }

  String _currentURL =
      'https://file-examples.com/storage/fe1134defc6538ed39b8efa/2017/11/file_example_MP3_700KB.mp3';
  String get currentURL => _currentURL;
  set currentURL(String value) {
    _currentURL = value;
  }

  final _docsManager = StreamRequestManager<List<ActivitiesRecord>>();
  Stream<List<ActivitiesRecord>> docs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ActivitiesRecord>> Function() requestFn,
  }) =>
      _docsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDocsCache() => _docsManager.clear();
  void clearDocsCacheKey(String? uniqueKey) =>
      _docsManager.clearRequest(uniqueKey);

  final _testManager = StreamRequestManager<List<ActivitiesRecord>>();
  Stream<List<ActivitiesRecord>> test({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ActivitiesRecord>> Function() requestFn,
  }) =>
      _testManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTestCache() => _testManager.clear();
  void clearTestCacheKey(String? uniqueKey) =>
      _testManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

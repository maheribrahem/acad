import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestTimingRecord extends FirestoreRecord {
  TestTimingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "testRef" field.
  DocumentReference? _testRef;
  DocumentReference? get testRef => _testRef;
  bool hasTestRef() => _testRef != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "origenTime" field.
  int? _origenTime;
  int get origenTime => _origenTime ?? 0;
  bool hasOrigenTime() => _origenTime != null;

  // "timeTaken" field.
  int? _timeTaken;
  int get timeTaken => _timeTaken ?? 0;
  bool hasTimeTaken() => _timeTaken != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  void _initializeFields() {
    _testRef = snapshotData['testRef'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _origenTime = castToType<int>(snapshotData['origenTime']);
    _timeTaken = castToType<int>(snapshotData['timeTaken']);
    _startTime = snapshotData['startTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testTiming');

  static Stream<TestTimingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestTimingRecord.fromSnapshot(s));

  static Future<TestTimingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestTimingRecord.fromSnapshot(s));

  static TestTimingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestTimingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestTimingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestTimingRecord._(reference, mapFromFirestore(data));

  static TestTimingRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TestTimingRecord.getDocumentFromData(
        {
          'testRef': convertAlgoliaParam(
            snapshot.data['testRef'],
            ParamType.DocumentReference,
            false,
          ),
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'origenTime': convertAlgoliaParam(
            snapshot.data['origenTime'],
            ParamType.int,
            false,
          ),
          'timeTaken': convertAlgoliaParam(
            snapshot.data['timeTaken'],
            ParamType.int,
            false,
          ),
          'startTime': convertAlgoliaParam(
            snapshot.data['startTime'],
            ParamType.DateTime,
            false,
          ),
        },
        TestTimingRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TestTimingRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'testTiming',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TestTimingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestTimingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestTimingRecordData({
  DocumentReference? testRef,
  DocumentReference? user,
  int? origenTime,
  int? timeTaken,
  DateTime? startTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'testRef': testRef,
      'user': user,
      'origenTime': origenTime,
      'timeTaken': timeTaken,
      'startTime': startTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestTimingRecordDocumentEquality implements Equality<TestTimingRecord> {
  const TestTimingRecordDocumentEquality();

  @override
  bool equals(TestTimingRecord? e1, TestTimingRecord? e2) {
    return e1?.testRef == e2?.testRef &&
        e1?.user == e2?.user &&
        e1?.origenTime == e2?.origenTime &&
        e1?.timeTaken == e2?.timeTaken &&
        e1?.startTime == e2?.startTime;
  }

  @override
  int hash(TestTimingRecord? e) => const ListEquality()
      .hash([e?.testRef, e?.user, e?.origenTime, e?.timeTaken, e?.startTime]);

  @override
  bool isValidKey(Object? o) => o is TestTimingRecord;
}

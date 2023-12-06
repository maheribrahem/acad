import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestTimingRecord extends FirestoreRecord {
  TestTimingRecord._(
    super.reference,
    super.data,
  ) {
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

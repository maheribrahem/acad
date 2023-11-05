import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsRecord extends FirestoreRecord {
  TestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "Qorder" field.
  int? _qorder;
  int get qorder => _qorder ?? 0;
  bool hasQorder() => _qorder != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  // "Aorder" field.
  int? _aorder;
  int get aorder => _aorder ?? 0;
  bool hasAorder() => _aorder != null;

  // "activitID" field.
  DocumentReference? _activitID;
  DocumentReference? get activitID => _activitID;
  bool hasActivitID() => _activitID != null;

  // "isFinal" field.
  bool? _isFinal;
  bool get isFinal => _isFinal ?? false;
  bool hasIsFinal() => _isFinal != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _qorder = castToType<int>(snapshotData['Qorder']);
    _answer = snapshotData['answer'] as String?;
    _isTrue = snapshotData['isTrue'] as bool?;
    _aorder = castToType<int>(snapshotData['Aorder']);
    _activitID = snapshotData['activitID'] as DocumentReference?;
    _isFinal = snapshotData['isFinal'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsRecord.fromSnapshot(s));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsRecord.fromSnapshot(s));

  static TestsRecord fromSnapshot(DocumentSnapshot snapshot) => TestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsRecord._(reference, mapFromFirestore(data));

  static TestsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TestsRecord.getDocumentFromData(
        {
          'question': snapshot.data['question'],
          'Qorder': convertAlgoliaParam(
            snapshot.data['Qorder'],
            ParamType.int,
            false,
          ),
          'answer': snapshot.data['answer'],
          'isTrue': snapshot.data['isTrue'],
          'Aorder': convertAlgoliaParam(
            snapshot.data['Aorder'],
            ParamType.int,
            false,
          ),
          'activitID': convertAlgoliaParam(
            snapshot.data['activitID'],
            ParamType.DocumentReference,
            false,
          ),
          'isFinal': snapshot.data['isFinal'],
        },
        TestsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TestsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tests',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestsRecordData({
  String? question,
  int? qorder,
  String? answer,
  bool? isTrue,
  int? aorder,
  DocumentReference? activitID,
  bool? isFinal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'Qorder': qorder,
      'answer': answer,
      'isTrue': isTrue,
      'Aorder': aorder,
      'activitID': activitID,
      'isFinal': isFinal,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestsRecordDocumentEquality implements Equality<TestsRecord> {
  const TestsRecordDocumentEquality();

  @override
  bool equals(TestsRecord? e1, TestsRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.qorder == e2?.qorder &&
        e1?.answer == e2?.answer &&
        e1?.isTrue == e2?.isTrue &&
        e1?.aorder == e2?.aorder &&
        e1?.activitID == e2?.activitID &&
        e1?.isFinal == e2?.isFinal;
  }

  @override
  int hash(TestsRecord? e) => const ListEquality().hash([
        e?.question,
        e?.qorder,
        e?.answer,
        e?.isTrue,
        e?.aorder,
        e?.activitID,
        e?.isFinal
      ]);

  @override
  bool isValidKey(Object? o) => o is TestsRecord;
}

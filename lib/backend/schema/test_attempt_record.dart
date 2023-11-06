import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestAttemptRecord extends FirestoreRecord {
  TestAttemptRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "testID" field.
  DocumentReference? _testID;
  DocumentReference? get testID => _testID;
  bool hasTestID() => _testID != null;

  // "answerInOrder" field.
  List<bool>? _answerInOrder;
  List<bool> get answerInOrder => _answerInOrder ?? const [];
  bool hasAnswerInOrder() => _answerInOrder != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _testID = snapshotData['testID'] as DocumentReference?;
    _answerInOrder = getDataList(snapshotData['answerInOrder']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testAttempt');

  static Stream<TestAttemptRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestAttemptRecord.fromSnapshot(s));

  static Future<TestAttemptRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestAttemptRecord.fromSnapshot(s));

  static TestAttemptRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestAttemptRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestAttemptRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestAttemptRecord._(reference, mapFromFirestore(data));

  static TestAttemptRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TestAttemptRecord.getDocumentFromData(
        {
          'userID': convertAlgoliaParam(
            snapshot.data['userID'],
            ParamType.DocumentReference,
            false,
          ),
          'testID': convertAlgoliaParam(
            snapshot.data['testID'],
            ParamType.DocumentReference,
            false,
          ),
          'answerInOrder': safeGet(
            () => snapshot.data['answerInOrder'].toList(),
          ),
        },
        TestAttemptRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TestAttemptRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'testAttempt',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TestAttemptRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestAttemptRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestAttemptRecordData({
  DocumentReference? userID,
  DocumentReference? testID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'testID': testID,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestAttemptRecordDocumentEquality implements Equality<TestAttemptRecord> {
  const TestAttemptRecordDocumentEquality();

  @override
  bool equals(TestAttemptRecord? e1, TestAttemptRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userID == e2?.userID &&
        e1?.testID == e2?.testID &&
        listEquality.equals(e1?.answerInOrder, e2?.answerInOrder);
  }

  @override
  int hash(TestAttemptRecord? e) =>
      const ListEquality().hash([e?.userID, e?.testID, e?.answerInOrder]);

  @override
  bool isValidKey(Object? o) => o is TestAttemptRecord;
}

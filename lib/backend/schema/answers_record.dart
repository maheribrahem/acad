import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "questionID" field.
  DocumentReference? _questionID;
  DocumentReference? get questionID => _questionID;
  bool hasQuestionID() => _questionID != null;

  void _initializeFields() {
    _answer = snapshotData['answer'] as String?;
    _isTrue = snapshotData['isTrue'] as bool?;
    _aorder = castToType<int>(snapshotData['Aorder']);
    _questionID = snapshotData['questionID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('answers');

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  static AnswersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AnswersRecord.getDocumentFromData(
        {
          'answer': snapshot.data['answer'],
          'isTrue': snapshot.data['isTrue'],
          'Aorder': convertAlgoliaParam(
            snapshot.data['Aorder'],
            ParamType.int,
            false,
          ),
          'questionID': convertAlgoliaParam(
            snapshot.data['questionID'],
            ParamType.DocumentReference,
            false,
          ),
        },
        AnswersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AnswersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'answers',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  String? answer,
  bool? isTrue,
  int? aorder,
  DocumentReference? questionID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'answer': answer,
      'isTrue': isTrue,
      'Aorder': aorder,
      'questionID': questionID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.answer == e2?.answer &&
        e1?.isTrue == e2?.isTrue &&
        e1?.aorder == e2?.aorder &&
        e1?.questionID == e2?.questionID;
  }

  @override
  int hash(AnswersRecord? e) => const ListEquality()
      .hash([e?.answer, e?.isTrue, e?.aorder, e?.questionID]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}

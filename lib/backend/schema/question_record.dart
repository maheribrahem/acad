import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "activitID" field.
  DocumentReference? _activitID;
  DocumentReference? get activitID => _activitID;
  bool hasActivitID() => _activitID != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _activitID = snapshotData['activitID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionRecordData({
  String? question,
  int? order,
  DocumentReference? activitID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'order': order,
      'activitID': activitID,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.order == e2?.order &&
        e1?.activitID == e2?.activitID;
  }

  @override
  int hash(QuestionRecord? e) =>
      const ListEquality().hash([e?.question, e?.order, e?.activitID]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}

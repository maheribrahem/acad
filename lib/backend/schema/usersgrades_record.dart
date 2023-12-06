import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersgradesRecord extends FirestoreRecord {
  UsersgradesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "gradeid" field.
  DocumentReference? _gradeid;
  DocumentReference? get gradeid => _gradeid;
  bool hasGradeid() => _gradeid != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  bool hasGrade() => _grade != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _gradeid = snapshotData['gradeid'] as DocumentReference?;
    _grade = castToType<int>(snapshotData['grade']);
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersgrades');

  static Stream<UsersgradesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersgradesRecord.fromSnapshot(s));

  static Future<UsersgradesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersgradesRecord.fromSnapshot(s));

  static UsersgradesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersgradesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersgradesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersgradesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersgradesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersgradesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersgradesRecordData({
  DocumentReference? uid,
  DocumentReference? gradeid,
  int? grade,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'gradeid': gradeid,
      'grade': grade,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersgradesRecordDocumentEquality implements Equality<UsersgradesRecord> {
  const UsersgradesRecordDocumentEquality();

  @override
  bool equals(UsersgradesRecord? e1, UsersgradesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.gradeid == e2?.gradeid &&
        e1?.grade == e2?.grade &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(UsersgradesRecord? e) =>
      const ListEquality().hash([e?.uid, e?.gradeid, e?.grade, e?.feedback]);

  @override
  bool isValidKey(Object? o) => o is UsersgradesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GradesRecord extends FirestoreRecord {
  GradesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "activitID" field.
  DocumentReference? _activitID;
  DocumentReference? get activitID => _activitID;
  bool hasActivitID() => _activitID != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  bool hasGrade() => _grade != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _activitID = snapshotData['activitID'] as DocumentReference?;
    _grade = castToType<int>(snapshotData['grade']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grades');

  static Stream<GradesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GradesRecord.fromSnapshot(s));

  static Future<GradesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GradesRecord.fromSnapshot(s));

  static GradesRecord fromSnapshot(DocumentSnapshot snapshot) => GradesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GradesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GradesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GradesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GradesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGradesRecordData({
  DocumentReference? userID,
  DocumentReference? activitID,
  int? grade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'activitID': activitID,
      'grade': grade,
    }.withoutNulls,
  );

  return firestoreData;
}

class GradesRecordDocumentEquality implements Equality<GradesRecord> {
  const GradesRecordDocumentEquality();

  @override
  bool equals(GradesRecord? e1, GradesRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.activitID == e2?.activitID &&
        e1?.grade == e2?.grade;
  }

  @override
  int hash(GradesRecord? e) =>
      const ListEquality().hash([e?.userID, e?.activitID, e?.grade]);

  @override
  bool isValidKey(Object? o) => o is GradesRecord;
}

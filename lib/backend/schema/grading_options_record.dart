import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradingOptionsRecord extends FirestoreRecord {
  GradingOptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "exams" field.
  int? _exams;
  int get exams => _exams ?? 0;
  bool hasExams() => _exams != null;

  // "exercise" field.
  int? _exercise;
  int get exercise => _exercise ?? 0;
  bool hasExercise() => _exercise != null;

  // "attend" field.
  int? _attend;
  int get attend => _attend ?? 0;
  bool hasAttend() => _attend != null;

  // "quran" field.
  int? _quran;
  int get quran => _quran ?? 0;
  bool hasQuran() => _quran != null;

  // "extras" field.
  List<GradingExtrasStruct>? _extras;
  List<GradingExtrasStruct> get extras => _extras ?? const [];
  bool hasExtras() => _extras != null;

  // "cohort" field.
  String? _cohort;
  String get cohort => _cohort ?? '';
  bool hasCohort() => _cohort != null;

  // "cohortRef" field.
  DocumentReference? _cohortRef;
  DocumentReference? get cohortRef => _cohortRef;
  bool hasCohortRef() => _cohortRef != null;

  // "categ" field.
  String? _categ;
  String get categ => _categ ?? '';
  bool hasCateg() => _categ != null;

  // "categRef" field.
  DocumentReference? _categRef;
  DocumentReference? get categRef => _categRef;
  bool hasCategRef() => _categRef != null;

  void _initializeFields() {
    _exams = castToType<int>(snapshotData['exams']);
    _exercise = castToType<int>(snapshotData['exercise']);
    _attend = castToType<int>(snapshotData['attend']);
    _quran = castToType<int>(snapshotData['quran']);
    _extras = getStructList(
      snapshotData['extras'],
      GradingExtrasStruct.fromMap,
    );
    _cohort = snapshotData['cohort'] as String?;
    _cohortRef = snapshotData['cohortRef'] as DocumentReference?;
    _categ = snapshotData['categ'] as String?;
    _categRef = snapshotData['categRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gradingOptions');

  static Stream<GradingOptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GradingOptionsRecord.fromSnapshot(s));

  static Future<GradingOptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GradingOptionsRecord.fromSnapshot(s));

  static GradingOptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GradingOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GradingOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GradingOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GradingOptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GradingOptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGradingOptionsRecordData({
  int? exams,
  int? exercise,
  int? attend,
  int? quran,
  String? cohort,
  DocumentReference? cohortRef,
  String? categ,
  DocumentReference? categRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'exams': exams,
      'exercise': exercise,
      'attend': attend,
      'quran': quran,
      'cohort': cohort,
      'cohortRef': cohortRef,
      'categ': categ,
      'categRef': categRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GradingOptionsRecordDocumentEquality
    implements Equality<GradingOptionsRecord> {
  const GradingOptionsRecordDocumentEquality();

  @override
  bool equals(GradingOptionsRecord? e1, GradingOptionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.exams == e2?.exams &&
        e1?.exercise == e2?.exercise &&
        e1?.attend == e2?.attend &&
        e1?.quran == e2?.quran &&
        listEquality.equals(e1?.extras, e2?.extras) &&
        e1?.cohort == e2?.cohort &&
        e1?.cohortRef == e2?.cohortRef &&
        e1?.categ == e2?.categ &&
        e1?.categRef == e2?.categRef;
  }

  @override
  int hash(GradingOptionsRecord? e) => const ListEquality().hash([
        e?.exams,
        e?.exercise,
        e?.attend,
        e?.quran,
        e?.extras,
        e?.cohort,
        e?.cohortRef,
        e?.categ,
        e?.categRef
      ]);

  @override
  bool isValidKey(Object? o) => o is GradingOptionsRecord;
}

import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cohort" field.
  String? _cohort;
  String get cohort => _cohort ?? '';
  bool hasCohort() => _cohort != null;

  // "supjName" field.
  String? _supjName;
  String get supjName => _supjName ?? '';
  bool hasSupjName() => _supjName != null;

  // "supnAttendance" field.
  List<String>? _supnAttendance;
  List<String> get supnAttendance => _supnAttendance ?? const [];
  bool hasSupnAttendance() => _supnAttendance != null;

  // "mentor" field.
  String? _mentor;
  String get mentor => _mentor ?? '';
  bool hasMentor() => _mentor != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _cohort = snapshotData['cohort'] as String?;
    _supjName = snapshotData['supjName'] as String?;
    _supnAttendance = getDataList(snapshotData['supnAttendance']);
    _mentor = snapshotData['mentor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  static AttendanceRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AttendanceRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'name': snapshot.data['name'],
          'cohort': snapshot.data['cohort'],
          'supjName': snapshot.data['supjName'],
          'supnAttendance': safeGet(
            () => snapshot.data['supnAttendance'].toList(),
          ),
          'mentor': snapshot.data['mentor'],
        },
        AttendanceRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AttendanceRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'attendance',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  String? email,
  String? name,
  String? cohort,
  String? supjName,
  String? mentor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'name': name,
      'cohort': cohort,
      'supjName': supjName,
      'mentor': mentor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.name == e2?.name &&
        e1?.cohort == e2?.cohort &&
        e1?.supjName == e2?.supjName &&
        listEquality.equals(e1?.supnAttendance, e2?.supnAttendance) &&
        e1?.mentor == e2?.mentor;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash([
        e?.email,
        e?.name,
        e?.cohort,
        e?.supjName,
        e?.supnAttendance,
        e?.mentor
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}

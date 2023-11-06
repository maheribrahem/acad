import 'dart:async';

import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GraduatedRecord extends FirestoreRecord {
  GraduatedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "grade" field.
  String? _grade;
  String get grade => _grade ?? '';
  bool hasGrade() => _grade != null;

  // "graduationName" field.
  String? _graduationName;
  String get graduationName => _graduationName ?? '';
  bool hasGraduationName() => _graduationName != null;

  // "total" field.
  String? _total;
  String get total => _total ?? '';
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _grade = snapshotData['grade'] as String?;
    _graduationName = snapshotData['graduationName'] as String?;
    _total = snapshotData['total'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('graduated');

  static Stream<GraduatedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GraduatedRecord.fromSnapshot(s));

  static Future<GraduatedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GraduatedRecord.fromSnapshot(s));

  static GraduatedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GraduatedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GraduatedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GraduatedRecord._(reference, mapFromFirestore(data));

  static GraduatedRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      GraduatedRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'email': snapshot.data['email'],
          'grade': snapshot.data['grade'],
          'graduationName': snapshot.data['graduationName'],
          'total': snapshot.data['total'],
        },
        GraduatedRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<GraduatedRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'graduated',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'GraduatedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GraduatedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGraduatedRecordData({
  String? name,
  String? email,
  String? grade,
  String? graduationName,
  String? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'grade': grade,
      'graduationName': graduationName,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraduatedRecordDocumentEquality implements Equality<GraduatedRecord> {
  const GraduatedRecordDocumentEquality();

  @override
  bool equals(GraduatedRecord? e1, GraduatedRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.grade == e2?.grade &&
        e1?.graduationName == e2?.graduationName &&
        e1?.total == e2?.total;
  }

  @override
  int hash(GraduatedRecord? e) => const ListEquality()
      .hash([e?.name, e?.email, e?.grade, e?.graduationName, e?.total]);

  @override
  bool isValidKey(Object? o) => o is GraduatedRecord;
}

import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupjsPerCohortsRecord extends FirestoreRecord {
  SupjsPerCohortsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cohort" field.
  String? _cohort;
  String get cohort => _cohort ?? '';
  bool hasCohort() => _cohort != null;

  // "supj1" field.
  String? _supj1;
  String get supj1 => _supj1 ?? '';
  bool hasSupj1() => _supj1 != null;

  // "supj2" field.
  String? _supj2;
  String get supj2 => _supj2 ?? '';
  bool hasSupj2() => _supj2 != null;

  // "supj3" field.
  String? _supj3;
  String get supj3 => _supj3 ?? '';
  bool hasSupj3() => _supj3 != null;

  // "supj4" field.
  String? _supj4;
  String get supj4 => _supj4 ?? '';
  bool hasSupj4() => _supj4 != null;

  // "supj5" field.
  String? _supj5;
  String get supj5 => _supj5 ?? '';
  bool hasSupj5() => _supj5 != null;

  // "supj6" field.
  String? _supj6;
  String get supj6 => _supj6 ?? '';
  bool hasSupj6() => _supj6 != null;

  // "supj7" field.
  String? _supj7;
  String get supj7 => _supj7 ?? '';
  bool hasSupj7() => _supj7 != null;

  // "supj8" field.
  String? _supj8;
  String get supj8 => _supj8 ?? '';
  bool hasSupj8() => _supj8 != null;

  // "supj9" field.
  String? _supj9;
  String get supj9 => _supj9 ?? '';
  bool hasSupj9() => _supj9 != null;

  void _initializeFields() {
    _cohort = snapshotData['cohort'] as String?;
    _supj1 = snapshotData['supj1'] as String?;
    _supj2 = snapshotData['supj2'] as String?;
    _supj3 = snapshotData['supj3'] as String?;
    _supj4 = snapshotData['supj4'] as String?;
    _supj5 = snapshotData['supj5'] as String?;
    _supj6 = snapshotData['supj6'] as String?;
    _supj7 = snapshotData['supj7'] as String?;
    _supj8 = snapshotData['supj8'] as String?;
    _supj9 = snapshotData['supj9'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supjsPerCohorts');

  static Stream<SupjsPerCohortsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupjsPerCohortsRecord.fromSnapshot(s));

  static Future<SupjsPerCohortsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupjsPerCohortsRecord.fromSnapshot(s));

  static SupjsPerCohortsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupjsPerCohortsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupjsPerCohortsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupjsPerCohortsRecord._(reference, mapFromFirestore(data));

  static SupjsPerCohortsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SupjsPerCohortsRecord.getDocumentFromData(
        {
          'cohort': snapshot.data['cohort'],
          'supj1': snapshot.data['supj1'],
          'supj2': snapshot.data['supj2'],
          'supj3': snapshot.data['supj3'],
          'supj4': snapshot.data['supj4'],
          'supj5': snapshot.data['supj5'],
          'supj6': snapshot.data['supj6'],
          'supj7': snapshot.data['supj7'],
          'supj8': snapshot.data['supj8'],
          'supj9': snapshot.data['supj9'],
        },
        SupjsPerCohortsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SupjsPerCohortsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'supjsPerCohorts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'SupjsPerCohortsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupjsPerCohortsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupjsPerCohortsRecordData({
  String? cohort,
  String? supj1,
  String? supj2,
  String? supj3,
  String? supj4,
  String? supj5,
  String? supj6,
  String? supj7,
  String? supj8,
  String? supj9,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cohort': cohort,
      'supj1': supj1,
      'supj2': supj2,
      'supj3': supj3,
      'supj4': supj4,
      'supj5': supj5,
      'supj6': supj6,
      'supj7': supj7,
      'supj8': supj8,
      'supj9': supj9,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupjsPerCohortsRecordDocumentEquality
    implements Equality<SupjsPerCohortsRecord> {
  const SupjsPerCohortsRecordDocumentEquality();

  @override
  bool equals(SupjsPerCohortsRecord? e1, SupjsPerCohortsRecord? e2) {
    return e1?.cohort == e2?.cohort &&
        e1?.supj1 == e2?.supj1 &&
        e1?.supj2 == e2?.supj2 &&
        e1?.supj3 == e2?.supj3 &&
        e1?.supj4 == e2?.supj4 &&
        e1?.supj5 == e2?.supj5 &&
        e1?.supj6 == e2?.supj6 &&
        e1?.supj7 == e2?.supj7 &&
        e1?.supj8 == e2?.supj8 &&
        e1?.supj9 == e2?.supj9;
  }

  @override
  int hash(SupjsPerCohortsRecord? e) => const ListEquality().hash([
        e?.cohort,
        e?.supj1,
        e?.supj2,
        e?.supj3,
        e?.supj4,
        e?.supj5,
        e?.supj6,
        e?.supj7,
        e?.supj8,
        e?.supj9
      ]);

  @override
  bool isValidKey(Object? o) => o is SupjsPerCohortsRecord;
}

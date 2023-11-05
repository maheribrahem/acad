import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CohortsRecord extends FirestoreRecord {
  CohortsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cohortsid" field.
  String? _cohortsid;
  String get cohortsid => _cohortsid ?? '';
  bool hasCohortsid() => _cohortsid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "categ" field.
  List<DocumentReference>? _categ;
  List<DocumentReference> get categ => _categ ?? const [];
  bool hasCateg() => _categ != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "updated" field.
  DateTime? _updated;
  DateTime? get updated => _updated;
  bool hasUpdated() => _updated != null;

  void _initializeFields() {
    _cohortsid = snapshotData['cohortsid'] as String?;
    _name = snapshotData['name'] as String?;
    _users = getDataList(snapshotData['users']);
    _categ = getDataList(snapshotData['categ']);
    _created = snapshotData['created'] as DateTime?;
    _updated = snapshotData['updated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cohorts');

  static Stream<CohortsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CohortsRecord.fromSnapshot(s));

  static Future<CohortsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CohortsRecord.fromSnapshot(s));

  static CohortsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CohortsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CohortsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CohortsRecord._(reference, mapFromFirestore(data));

  static CohortsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CohortsRecord.getDocumentFromData(
        {
          'cohortsid': snapshot.data['cohortsid'],
          'name': snapshot.data['name'],
          'users': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['users'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'categ': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['categ'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'created': convertAlgoliaParam(
            snapshot.data['created'],
            ParamType.DateTime,
            false,
          ),
          'updated': convertAlgoliaParam(
            snapshot.data['updated'],
            ParamType.DateTime,
            false,
          ),
        },
        CohortsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CohortsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'cohorts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CohortsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CohortsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCohortsRecordData({
  String? cohortsid,
  String? name,
  DateTime? created,
  DateTime? updated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cohortsid': cohortsid,
      'name': name,
      'created': created,
      'updated': updated,
    }.withoutNulls,
  );

  return firestoreData;
}

class CohortsRecordDocumentEquality implements Equality<CohortsRecord> {
  const CohortsRecordDocumentEquality();

  @override
  bool equals(CohortsRecord? e1, CohortsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cohortsid == e2?.cohortsid &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.categ, e2?.categ) &&
        e1?.created == e2?.created &&
        e1?.updated == e2?.updated;
  }

  @override
  int hash(CohortsRecord? e) => const ListEquality().hash(
      [e?.cohortsid, e?.name, e?.users, e?.categ, e?.created, e?.updated]);

  @override
  bool isValidKey(Object? o) => o is CohortsRecord;
}

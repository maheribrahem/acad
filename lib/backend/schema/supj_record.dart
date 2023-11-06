import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupjRecord extends FirestoreRecord {
  SupjRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "supId" field.
  String? _supId;
  String get supId => _supId ?? '';
  bool hasSupId() => _supId != null;

  // "cohorts" field.
  List<DocumentReference>? _cohorts;
  List<DocumentReference> get cohorts => _cohorts ?? const [];
  bool hasCohorts() => _cohorts != null;

  // "teachers" field.
  DocumentReference? _teachers;
  DocumentReference? get teachers => _teachers;
  bool hasTeachers() => _teachers != null;

  // "supCateg" field.
  DocumentReference? _supCateg;
  DocumentReference? get supCateg => _supCateg;
  bool hasSupCateg() => _supCateg != null;

  // "teacherString" field.
  String? _teacherString;
  String get teacherString => _teacherString ?? '';
  bool hasTeacherString() => _teacherString != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "visibility" field.
  bool? _visibility;
  bool get visibility => _visibility ?? false;
  bool hasVisibility() => _visibility != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _cover = snapshotData['cover'] as String?;
    _supId = snapshotData['supId'] as String?;
    _cohorts = getDataList(snapshotData['cohorts']);
    _teachers = snapshotData['teachers'] as DocumentReference?;
    _supCateg = snapshotData['supCateg'] as DocumentReference?;
    _teacherString = snapshotData['teacherString'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _visibility = snapshotData['visibility'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supj');

  static Stream<SupjRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupjRecord.fromSnapshot(s));

  static Future<SupjRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupjRecord.fromSnapshot(s));

  static SupjRecord fromSnapshot(DocumentSnapshot snapshot) => SupjRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupjRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupjRecord._(reference, mapFromFirestore(data));

  static SupjRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SupjRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'cover': snapshot.data['cover'],
          'supId': snapshot.data['supId'],
          'cohorts': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['cohorts'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'teachers': convertAlgoliaParam(
            snapshot.data['teachers'],
            ParamType.DocumentReference,
            false,
          ),
          'supCateg': convertAlgoliaParam(
            snapshot.data['supCateg'],
            ParamType.DocumentReference,
            false,
          ),
          'teacherString': snapshot.data['teacherString'],
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'visibility': snapshot.data['visibility'],
        },
        SupjRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SupjRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'supj',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'SupjRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupjRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupjRecordData({
  String? name,
  String? description,
  String? cover,
  String? supId,
  DocumentReference? teachers,
  DocumentReference? supCateg,
  String? teacherString,
  bool? visibility,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'cover': cover,
      'supId': supId,
      'teachers': teachers,
      'supCateg': supCateg,
      'teacherString': teacherString,
      'visibility': visibility,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupjRecordDocumentEquality implements Equality<SupjRecord> {
  const SupjRecordDocumentEquality();

  @override
  bool equals(SupjRecord? e1, SupjRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.cover == e2?.cover &&
        e1?.supId == e2?.supId &&
        listEquality.equals(e1?.cohorts, e2?.cohorts) &&
        e1?.teachers == e2?.teachers &&
        e1?.supCateg == e2?.supCateg &&
        e1?.teacherString == e2?.teacherString &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.visibility == e2?.visibility;
  }

  @override
  int hash(SupjRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.cover,
        e?.supId,
        e?.cohorts,
        e?.teachers,
        e?.supCateg,
        e?.teacherString,
        e?.tags,
        e?.visibility
      ]);

  @override
  bool isValidKey(Object? o) => o is SupjRecord;
}

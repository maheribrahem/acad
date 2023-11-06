import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategRecord extends FirestoreRecord {
  CategRecord._(
    super.reference,
    super.data,
  ) {
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

  // "supCateg" field.
  String? _supCateg;
  String get supCateg => _supCateg ?? '';
  bool hasSupCateg() => _supCateg != null;

  // "isSupCateg" field.
  bool? _isSupCateg;
  bool get isSupCateg => _isSupCateg ?? false;
  bool hasIsSupCateg() => _isSupCateg != null;

  // "categid" field.
  String? _categid;
  String get categid => _categid ?? '';
  bool hasCategid() => _categid != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "cohorts" field.
  List<DocumentReference>? _cohorts;
  List<DocumentReference> get cohorts => _cohorts ?? const [];
  bool hasCohorts() => _cohorts != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _supCateg = snapshotData['supCateg'] as String?;
    _isSupCateg = snapshotData['isSupCateg'] as bool?;
    _categid = snapshotData['categid'] as String?;
    _cover = snapshotData['cover'] as String?;
    _video = snapshotData['video'] as String?;
    _cohorts = getDataList(snapshotData['cohorts']);
    _available = snapshotData['available'] as bool?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categ');

  static Stream<CategRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategRecord.fromSnapshot(s));

  static Future<CategRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategRecord.fromSnapshot(s));

  static CategRecord fromSnapshot(DocumentSnapshot snapshot) => CategRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategRecord._(reference, mapFromFirestore(data));

  static CategRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CategRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'supCateg': snapshot.data['supCateg'],
          'isSupCateg': snapshot.data['isSupCateg'],
          'categid': snapshot.data['categid'],
          'cover': snapshot.data['cover'],
          'video': snapshot.data['video'],
          'cohorts': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['cohorts'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'available': snapshot.data['available'],
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
        },
        CategRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CategRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'categ',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CategRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategRecordData({
  String? name,
  String? description,
  String? supCateg,
  bool? isSupCateg,
  String? categid,
  String? cover,
  String? video,
  bool? available,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'supCateg': supCateg,
      'isSupCateg': isSupCateg,
      'categid': categid,
      'cover': cover,
      'video': video,
      'available': available,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategRecordDocumentEquality implements Equality<CategRecord> {
  const CategRecordDocumentEquality();

  @override
  bool equals(CategRecord? e1, CategRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.supCateg == e2?.supCateg &&
        e1?.isSupCateg == e2?.isSupCateg &&
        e1?.categid == e2?.categid &&
        e1?.cover == e2?.cover &&
        e1?.video == e2?.video &&
        listEquality.equals(e1?.cohorts, e2?.cohorts) &&
        e1?.available == e2?.available &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(CategRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.supCateg,
        e?.isSupCateg,
        e?.categid,
        e?.cover,
        e?.video,
        e?.cohorts,
        e?.available,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is CategRecord;
}

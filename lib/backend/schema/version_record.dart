import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersionRecord extends FirestoreRecord {
  VersionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "version" field.
  String? _version;
  String get version => _version ?? '';
  bool hasVersion() => _version != null;

  void _initializeFields() {
    _version = snapshotData['version'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('version');

  static Stream<VersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionRecord.fromSnapshot(s));

  static Future<VersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionRecord.fromSnapshot(s));

  static VersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionRecord._(reference, mapFromFirestore(data));

  static VersionRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VersionRecord.getDocumentFromData(
        {
          'version': snapshot.data['version'],
        },
        VersionRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VersionRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'version',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'VersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionRecordData({
  String? version,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionRecordDocumentEquality implements Equality<VersionRecord> {
  const VersionRecordDocumentEquality();

  @override
  bool equals(VersionRecord? e1, VersionRecord? e2) {
    return e1?.version == e2?.version;
  }

  @override
  int hash(VersionRecord? e) => const ListEquality().hash([e?.version]);

  @override
  bool isValidKey(Object? o) => o is VersionRecord;
}

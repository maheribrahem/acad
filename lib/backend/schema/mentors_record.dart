import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MentorsRecord extends FirestoreRecord {
  MentorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mentorid" field.
  DocumentReference? _mentorid;
  DocumentReference? get mentorid => _mentorid;
  bool hasMentorid() => _mentorid != null;

  // "mentorname" field.
  String? _mentorname;
  String get mentorname => _mentorname ?? '';
  bool hasMentorname() => _mentorname != null;

  // "mentoremail" field.
  String? _mentoremail;
  String get mentoremail => _mentoremail ?? '';
  bool hasMentoremail() => _mentoremail != null;

  void _initializeFields() {
    _mentorid = snapshotData['mentorid'] as DocumentReference?;
    _mentorname = snapshotData['mentorname'] as String?;
    _mentoremail = snapshotData['mentoremail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mentors');

  static Stream<MentorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MentorsRecord.fromSnapshot(s));

  static Future<MentorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MentorsRecord.fromSnapshot(s));

  static MentorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MentorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MentorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MentorsRecord._(reference, mapFromFirestore(data));

  static MentorsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MentorsRecord.getDocumentFromData(
        {
          'mentorid': convertAlgoliaParam(
            snapshot.data['mentorid'],
            ParamType.DocumentReference,
            false,
          ),
          'mentorname': snapshot.data['mentorname'],
          'mentoremail': snapshot.data['mentoremail'],
        },
        MentorsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MentorsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'mentors',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'MentorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MentorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMentorsRecordData({
  DocumentReference? mentorid,
  String? mentorname,
  String? mentoremail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mentorid': mentorid,
      'mentorname': mentorname,
      'mentoremail': mentoremail,
    }.withoutNulls,
  );

  return firestoreData;
}

class MentorsRecordDocumentEquality implements Equality<MentorsRecord> {
  const MentorsRecordDocumentEquality();

  @override
  bool equals(MentorsRecord? e1, MentorsRecord? e2) {
    return e1?.mentorid == e2?.mentorid &&
        e1?.mentorname == e2?.mentorname &&
        e1?.mentoremail == e2?.mentoremail;
  }

  @override
  int hash(MentorsRecord? e) =>
      const ListEquality().hash([e?.mentorid, e?.mentorname, e?.mentoremail]);

  @override
  bool isValidKey(Object? o) => o is MentorsRecord;
}

import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "mentor" field.
  DocumentReference? _mentor;
  DocumentReference? get mentor => _mentor;
  bool hasMentor() => _mentor != null;

  // "groupid" field.
  String? _groupid;
  String get groupid => _groupid ?? '';
  bool hasGroupid() => _groupid != null;

  // "members" field.
  List<UsersMentorStruct>? _members;
  List<UsersMentorStruct> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _mentor = snapshotData['mentor'] as DocumentReference?;
    _groupid = snapshotData['groupid'] as String?;
    _members = getStructList(
      snapshotData['members'],
      UsersMentorStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  static GroupsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      GroupsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'mentor': convertAlgoliaParam(
            snapshot.data['mentor'],
            ParamType.DocumentReference,
            false,
          ),
          'groupid': snapshot.data['groupid'],
          'members': safeGet(
            () => (snapshot.data['members'] as Iterable)
                .map((d) => UsersMentorStruct.fromAlgoliaData(d))
                .toList(),
          ),
        },
        GroupsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<GroupsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'groups',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  DocumentReference? mentor,
  String? groupid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'mentor': mentor,
      'groupid': groupid,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.mentor == e2?.mentor &&
        e1?.groupid == e2?.groupid &&
        listEquality.equals(e1?.members, e2?.members);
  }

  @override
  int hash(GroupsRecord? e) =>
      const ListEquality().hash([e?.name, e?.mentor, e?.groupid, e?.members]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}

import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitiesProgressRecord extends FirestoreRecord {
  ActivitiesProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activitID" field.
  DocumentReference? _activitID;
  DocumentReference? get activitID => _activitID;
  bool hasActivitID() => _activitID != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  bool hasWhen() => _when != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "isAttended" field.
  bool? _isAttended;
  bool get isAttended => _isAttended ?? false;
  bool hasIsAttended() => _isAttended != null;

  // "supjID" field.
  DocumentReference? _supjID;
  DocumentReference? get supjID => _supjID;
  bool hasSupjID() => _supjID != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "grade" field.
  double? _grade;
  double get grade => _grade ?? 0.0;
  bool hasGrade() => _grade != null;

  // "isFinal" field.
  bool? _isFinal;
  bool get isFinal => _isFinal ?? false;
  bool hasIsFinal() => _isFinal != null;

  // "categRef" field.
  DocumentReference? _categRef;
  DocumentReference? get categRef => _categRef;
  bool hasCategRef() => _categRef != null;

  void _initializeFields() {
    _activitID = snapshotData['activitID'] as DocumentReference?;
    _isDone = snapshotData['isDone'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _when = snapshotData['when'] as DateTime?;
    _isSeen = snapshotData['isSeen'] as bool?;
    _isAttended = snapshotData['isAttended'] as bool?;
    _supjID = snapshotData['supjID'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _grade = castToType<double>(snapshotData['grade']);
    _isFinal = snapshotData['isFinal'] as bool?;
    _categRef = snapshotData['categRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activitiesProgress');

  static Stream<ActivitiesProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesProgressRecord.fromSnapshot(s));

  static Future<ActivitiesProgressRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActivitiesProgressRecord.fromSnapshot(s));

  static ActivitiesProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesProgressRecord._(reference, mapFromFirestore(data));

  static ActivitiesProgressRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ActivitiesProgressRecord.getDocumentFromData(
        {
          'activitID': convertAlgoliaParam(
            snapshot.data['activitID'],
            ParamType.DocumentReference,
            false,
          ),
          'isDone': snapshot.data['isDone'],
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'when': convertAlgoliaParam(
            snapshot.data['when'],
            ParamType.DateTime,
            false,
          ),
          'isSeen': snapshot.data['isSeen'],
          'isAttended': snapshot.data['isAttended'],
          'supjID': convertAlgoliaParam(
            snapshot.data['supjID'],
            ParamType.DocumentReference,
            false,
          ),
          'type': snapshot.data['type'],
          'grade': convertAlgoliaParam(
            snapshot.data['grade'],
            ParamType.double,
            false,
          ),
          'isFinal': snapshot.data['isFinal'],
          'categRef': convertAlgoliaParam(
            snapshot.data['categRef'],
            ParamType.DocumentReference,
            false,
          ),
        },
        ActivitiesProgressRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ActivitiesProgressRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'activitiesProgress',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ActivitiesProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesProgressRecordData({
  DocumentReference? activitID,
  bool? isDone,
  DocumentReference? user,
  DateTime? when,
  bool? isSeen,
  bool? isAttended,
  DocumentReference? supjID,
  String? type,
  double? grade,
  bool? isFinal,
  DocumentReference? categRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activitID': activitID,
      'isDone': isDone,
      'user': user,
      'when': when,
      'isSeen': isSeen,
      'isAttended': isAttended,
      'supjID': supjID,
      'type': type,
      'grade': grade,
      'isFinal': isFinal,
      'categRef': categRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesProgressRecordDocumentEquality
    implements Equality<ActivitiesProgressRecord> {
  const ActivitiesProgressRecordDocumentEquality();

  @override
  bool equals(ActivitiesProgressRecord? e1, ActivitiesProgressRecord? e2) {
    return e1?.activitID == e2?.activitID &&
        e1?.isDone == e2?.isDone &&
        e1?.user == e2?.user &&
        e1?.when == e2?.when &&
        e1?.isSeen == e2?.isSeen &&
        e1?.isAttended == e2?.isAttended &&
        e1?.supjID == e2?.supjID &&
        e1?.type == e2?.type &&
        e1?.grade == e2?.grade &&
        e1?.isFinal == e2?.isFinal &&
        e1?.categRef == e2?.categRef;
  }

  @override
  int hash(ActivitiesProgressRecord? e) => const ListEquality().hash([
        e?.activitID,
        e?.isDone,
        e?.user,
        e?.when,
        e?.isSeen,
        e?.isAttended,
        e?.supjID,
        e?.type,
        e?.grade,
        e?.isFinal,
        e?.categRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesProgressRecord;
}

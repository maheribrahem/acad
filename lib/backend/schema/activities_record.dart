import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitiesRecord extends FirestoreRecord {
  ActivitiesRecord._(
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "gradable" field.
  bool? _gradable;
  bool get gradable => _gradable ?? false;
  bool hasGradable() => _gradable != null;

  // "activid" field.
  String? _activid;
  String get activid => _activid ?? '';
  bool hasActivid() => _activid != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "doc" field.
  String? _doc;
  String get doc => _doc ?? '';
  bool hasDoc() => _doc != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "supjRef" field.
  DocumentReference? _supjRef;
  DocumentReference? get supjRef => _supjRef;
  bool hasSupjRef() => _supjRef != null;

  // "grades" field.
  int? _grades;
  int get grades => _grades ?? 0;
  bool hasGrades() => _grades != null;

  // "teacher" field.
  String? _teacher;
  String get teacher => _teacher ?? '';
  bool hasTeacher() => _teacher != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "isYoutube" field.
  bool? _isYoutube;
  bool get isYoutube => _isYoutube ?? false;
  bool hasIsYoutube() => _isYoutube != null;

  // "docsType" field.
  String? _docsType;
  String get docsType => _docsType ?? '';
  bool hasDocsType() => _docsType != null;

  // "isFinal" field.
  bool? _isFinal;
  bool get isFinal => _isFinal ?? false;
  bool hasIsFinal() => _isFinal != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "visibility" field.
  bool? _visibility;
  bool get visibility => _visibility ?? false;
  bool hasVisibility() => _visibility != null;

  // "howLong" field.
  int? _howLong;
  int get howLong => _howLong ?? 0;
  bool hasHowLong() => _howLong != null;

  // "howMany" field.
  int? _howMany;
  int get howMany => _howMany ?? 0;
  bool hasHowMany() => _howMany != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _gradable = snapshotData['gradable'] as bool?;
    _activid = snapshotData['activid'] as String?;
    _audio = snapshotData['audio'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _doc = snapshotData['doc'] as String?;
    _isDone = snapshotData['isDone'] as bool?;
    _supjRef = snapshotData['supjRef'] as DocumentReference?;
    _grades = castToType<int>(snapshotData['grades']);
    _teacher = snapshotData['teacher'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _time = snapshotData['time'] as String?;
    _isYoutube = snapshotData['isYoutube'] as bool?;
    _docsType = snapshotData['docsType'] as String?;
    _isFinal = snapshotData['isFinal'] as bool?;
    _available = snapshotData['available'] as bool?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _visibility = snapshotData['visibility'] as bool?;
    _howLong = castToType<int>(snapshotData['howLong']);
    _howMany = castToType<int>(snapshotData['howMany']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activities');

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesRecord.fromSnapshot(s));

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitiesRecord.fromSnapshot(s));

  static ActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesRecord._(reference, mapFromFirestore(data));

  static ActivitiesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ActivitiesRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'type': snapshot.data['type'],
          'gradable': snapshot.data['gradable'],
          'activid': snapshot.data['activid'],
          'audio': snapshot.data['audio'],
          'image': snapshot.data['image'],
          'video': snapshot.data['video'],
          'doc': snapshot.data['doc'],
          'isDone': snapshot.data['isDone'],
          'supjRef': convertAlgoliaParam(
            snapshot.data['supjRef'],
            ParamType.DocumentReference,
            false,
          ),
          'grades': convertAlgoliaParam(
            snapshot.data['grades'],
            ParamType.int,
            false,
          ),
          'teacher': snapshot.data['teacher'],
          'order': convertAlgoliaParam(
            snapshot.data['order'],
            ParamType.int,
            false,
          ),
          'time': snapshot.data['time'],
          'isYoutube': snapshot.data['isYoutube'],
          'docsType': snapshot.data['docsType'],
          'isFinal': snapshot.data['isFinal'],
          'available': snapshot.data['available'],
          'startTime': convertAlgoliaParam(
            snapshot.data['startTime'],
            ParamType.DateTime,
            false,
          ),
          'endTime': convertAlgoliaParam(
            snapshot.data['endTime'],
            ParamType.DateTime,
            false,
          ),
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'visibility': snapshot.data['visibility'],
          'howLong': convertAlgoliaParam(
            snapshot.data['howLong'],
            ParamType.int,
            false,
          ),
          'howMany': convertAlgoliaParam(
            snapshot.data['howMany'],
            ParamType.int,
            false,
          ),
        },
        ActivitiesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ActivitiesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'activities',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesRecordData({
  String? name,
  String? description,
  String? type,
  bool? gradable,
  String? activid,
  String? audio,
  String? image,
  String? video,
  String? doc,
  bool? isDone,
  DocumentReference? supjRef,
  int? grades,
  String? teacher,
  int? order,
  String? time,
  bool? isYoutube,
  String? docsType,
  bool? isFinal,
  bool? available,
  DateTime? startTime,
  DateTime? endTime,
  bool? visibility,
  int? howLong,
  int? howMany,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'type': type,
      'gradable': gradable,
      'activid': activid,
      'audio': audio,
      'image': image,
      'video': video,
      'doc': doc,
      'isDone': isDone,
      'supjRef': supjRef,
      'grades': grades,
      'teacher': teacher,
      'order': order,
      'time': time,
      'isYoutube': isYoutube,
      'docsType': docsType,
      'isFinal': isFinal,
      'available': available,
      'startTime': startTime,
      'endTime': endTime,
      'visibility': visibility,
      'howLong': howLong,
      'howMany': howMany,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesRecordDocumentEquality implements Equality<ActivitiesRecord> {
  const ActivitiesRecordDocumentEquality();

  @override
  bool equals(ActivitiesRecord? e1, ActivitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.gradable == e2?.gradable &&
        e1?.activid == e2?.activid &&
        e1?.audio == e2?.audio &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.doc == e2?.doc &&
        e1?.isDone == e2?.isDone &&
        e1?.supjRef == e2?.supjRef &&
        e1?.grades == e2?.grades &&
        e1?.teacher == e2?.teacher &&
        e1?.order == e2?.order &&
        e1?.time == e2?.time &&
        e1?.isYoutube == e2?.isYoutube &&
        e1?.docsType == e2?.docsType &&
        e1?.isFinal == e2?.isFinal &&
        e1?.available == e2?.available &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.visibility == e2?.visibility &&
        e1?.howLong == e2?.howLong &&
        e1?.howMany == e2?.howMany;
  }

  @override
  int hash(ActivitiesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.type,
        e?.gradable,
        e?.activid,
        e?.audio,
        e?.image,
        e?.video,
        e?.doc,
        e?.isDone,
        e?.supjRef,
        e?.grades,
        e?.teacher,
        e?.order,
        e?.time,
        e?.isYoutube,
        e?.docsType,
        e?.isFinal,
        e?.available,
        e?.startTime,
        e?.endTime,
        e?.tags,
        e?.visibility,
        e?.howLong,
        e?.howMany
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesRecord;
}

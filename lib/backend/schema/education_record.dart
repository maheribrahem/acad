import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationRecord extends FirestoreRecord {
  EducationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "mentoring" field.
  bool? _mentoring;
  bool get mentoring => _mentoring ?? false;
  bool hasMentoring() => _mentoring != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "sendTime" field.
  DateTime? _sendTime;
  DateTime? get sendTime => _sendTime;
  bool hasSendTime() => _sendTime != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "mentor" field.
  DocumentReference? _mentor;
  DocumentReference? get mentor => _mentor;
  bool hasMentor() => _mentor != null;

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "doc" field.
  String? _doc;
  String get doc => _doc ?? '';
  bool hasDoc() => _doc != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "chattId" field.
  String? _chattId;
  String get chattId => _chattId ?? '';
  bool hasChattId() => _chattId != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _mentoring = snapshotData['mentoring'] as bool?;
    _text = snapshotData['text'] as String?;
    _sendTime = snapshotData['sendTime'] as DateTime?;
    _isSeen = snapshotData['isSeen'] as bool?;
    _mentor = snapshotData['mentor'] as DocumentReference?;
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _doc = snapshotData['doc'] as String?;
    _audio = snapshotData['audio'] as String?;
    _chattId = snapshotData['chattId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('education');

  static Stream<EducationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EducationRecord.fromSnapshot(s));

  static Future<EducationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EducationRecord.fromSnapshot(s));

  static EducationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EducationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EducationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EducationRecord._(reference, mapFromFirestore(data));

  static EducationRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EducationRecord.getDocumentFromData(
        {
          'sender': convertAlgoliaParam(
            snapshot.data['sender'],
            ParamType.DocumentReference,
            false,
          ),
          'receiver': convertAlgoliaParam(
            snapshot.data['receiver'],
            ParamType.DocumentReference,
            false,
          ),
          'mentoring': snapshot.data['mentoring'],
          'text': snapshot.data['text'],
          'sendTime': convertAlgoliaParam(
            snapshot.data['sendTime'],
            ParamType.DateTime,
            false,
          ),
          'isSeen': snapshot.data['isSeen'],
          'mentor': convertAlgoliaParam(
            snapshot.data['mentor'],
            ParamType.DocumentReference,
            false,
          ),
          'classRef': convertAlgoliaParam(
            snapshot.data['classRef'],
            ParamType.DocumentReference,
            false,
          ),
          'image': snapshot.data['image'],
          'doc': snapshot.data['doc'],
          'audio': snapshot.data['audio'],
          'chattId': snapshot.data['chattId'],
        },
        EducationRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EducationRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'education',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EducationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EducationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEducationRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  bool? mentoring,
  String? text,
  DateTime? sendTime,
  bool? isSeen,
  DocumentReference? mentor,
  DocumentReference? classRef,
  String? image,
  String? doc,
  String? audio,
  String? chattId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'mentoring': mentoring,
      'text': text,
      'sendTime': sendTime,
      'isSeen': isSeen,
      'mentor': mentor,
      'classRef': classRef,
      'image': image,
      'doc': doc,
      'audio': audio,
      'chattId': chattId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EducationRecordDocumentEquality implements Equality<EducationRecord> {
  const EducationRecordDocumentEquality();

  @override
  bool equals(EducationRecord? e1, EducationRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.mentoring == e2?.mentoring &&
        e1?.text == e2?.text &&
        e1?.sendTime == e2?.sendTime &&
        e1?.isSeen == e2?.isSeen &&
        e1?.mentor == e2?.mentor &&
        e1?.classRef == e2?.classRef &&
        e1?.image == e2?.image &&
        e1?.doc == e2?.doc &&
        e1?.audio == e2?.audio &&
        e1?.chattId == e2?.chattId;
  }

  @override
  int hash(EducationRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.mentoring,
        e?.text,
        e?.sendTime,
        e?.isSeen,
        e?.mentor,
        e?.classRef,
        e?.image,
        e?.doc,
        e?.audio,
        e?.chattId
      ]);

  @override
  bool isValidKey(Object? o) => o is EducationRecord;
}

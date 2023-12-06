import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DiscussionRecord extends FirestoreRecord {
  DiscussionRecord._(
    super.reference,
    super.data,
  ) {
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

  // "userA" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "userB" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

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
    _userA = snapshotData['userA'] as DocumentReference?;
    _userB = snapshotData['userB'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discussion');

  static Stream<DiscussionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscussionRecord.fromSnapshot(s));

  static Future<DiscussionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiscussionRecord.fromSnapshot(s));

  static DiscussionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscussionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscussionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscussionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscussionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscussionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscussionRecordData({
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
  DocumentReference? userA,
  DocumentReference? userB,
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
      'userA': userA,
      'userB': userB,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscussionRecordDocumentEquality implements Equality<DiscussionRecord> {
  const DiscussionRecordDocumentEquality();

  @override
  bool equals(DiscussionRecord? e1, DiscussionRecord? e2) {
    const listEquality = ListEquality();
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
        e1?.chattId == e2?.chattId &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(DiscussionRecord? e) => const ListEquality().hash([
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
        e?.chattId,
        e?.userA,
        e?.userB,
        e?.users
      ]);

  @override
  bool isValidKey(Object? o) => o is DiscussionRecord;
}

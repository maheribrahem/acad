import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReadsRecord extends FirestoreRecord {
  ReadsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "reads" field.
  int? _reads;
  int get reads => _reads ?? 0;
  bool hasReads() => _reads != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _reads = castToType<int>(snapshotData['reads']);
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _admin = snapshotData['admin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reads');

  static Stream<ReadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReadsRecord.fromSnapshot(s));

  static Future<ReadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReadsRecord.fromSnapshot(s));

  static ReadsRecord fromSnapshot(DocumentSnapshot snapshot) => ReadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReadsRecordData({
  String? name,
  int? reads,
  DateTime? timeStamp,
  bool? admin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'reads': reads,
      'timeStamp': timeStamp,
      'admin': admin,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReadsRecordDocumentEquality implements Equality<ReadsRecord> {
  const ReadsRecordDocumentEquality();

  @override
  bool equals(ReadsRecord? e1, ReadsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.reads == e2?.reads &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.admin == e2?.admin;
  }

  @override
  int hash(ReadsRecord? e) =>
      const ListEquality().hash([e?.name, e?.reads, e?.timeStamp, e?.admin]);

  @override
  bool isValidKey(Object? o) => o is ReadsRecord;
}

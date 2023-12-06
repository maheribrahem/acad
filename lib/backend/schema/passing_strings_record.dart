import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PassingStringsRecord extends FirestoreRecord {
  PassingStringsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "delete" field.
  String? _delete;
  String get delete => _delete ?? '';
  bool hasDelete() => _delete != null;

  // "edit" field.
  String? _edit;
  String get edit => _edit ?? '';
  bool hasEdit() => _edit != null;

  // "add" field.
  String? _add;
  String get add => _add ?? '';
  bool hasAdd() => _add != null;

  // "show" field.
  String? _show;
  String get show => _show ?? '';
  bool hasShow() => _show != null;

  void _initializeFields() {
    _delete = snapshotData['delete'] as String?;
    _edit = snapshotData['edit'] as String?;
    _add = snapshotData['add'] as String?;
    _show = snapshotData['show'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passingStrings');

  static Stream<PassingStringsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassingStringsRecord.fromSnapshot(s));

  static Future<PassingStringsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassingStringsRecord.fromSnapshot(s));

  static PassingStringsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassingStringsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassingStringsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassingStringsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassingStringsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassingStringsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassingStringsRecordData({
  String? delete,
  String? edit,
  String? add,
  String? show,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'delete': delete,
      'edit': edit,
      'add': add,
      'show': show,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassingStringsRecordDocumentEquality
    implements Equality<PassingStringsRecord> {
  const PassingStringsRecordDocumentEquality();

  @override
  bool equals(PassingStringsRecord? e1, PassingStringsRecord? e2) {
    return e1?.delete == e2?.delete &&
        e1?.edit == e2?.edit &&
        e1?.add == e2?.add &&
        e1?.show == e2?.show;
  }

  @override
  int hash(PassingStringsRecord? e) =>
      const ListEquality().hash([e?.delete, e?.edit, e?.add, e?.show]);

  @override
  bool isValidKey(Object? o) => o is PassingStringsRecord;
}

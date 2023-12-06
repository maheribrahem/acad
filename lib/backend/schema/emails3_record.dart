import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Emails3Record extends FirestoreRecord {
  Emails3Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "numm" field.
  int? _numm;
  int get numm => _numm ?? 0;
  bool hasNumm() => _numm != null;

  // "refrence" field.
  DocumentReference? _refrence;
  DocumentReference? get refrence => _refrence;
  bool hasRefrence() => _refrence != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _numm = castToType<int>(snapshotData['numm']);
    _refrence = snapshotData['refrence'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emails3');

  static Stream<Emails3Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Emails3Record.fromSnapshot(s));

  static Future<Emails3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Emails3Record.fromSnapshot(s));

  static Emails3Record fromSnapshot(DocumentSnapshot snapshot) =>
      Emails3Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Emails3Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Emails3Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Emails3Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Emails3Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmails3RecordData({
  String? email,
  int? numm,
  DocumentReference? refrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'numm': numm,
      'refrence': refrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class Emails3RecordDocumentEquality implements Equality<Emails3Record> {
  const Emails3RecordDocumentEquality();

  @override
  bool equals(Emails3Record? e1, Emails3Record? e2) {
    return e1?.email == e2?.email &&
        e1?.numm == e2?.numm &&
        e1?.refrence == e2?.refrence;
  }

  @override
  int hash(Emails3Record? e) =>
      const ListEquality().hash([e?.email, e?.numm, e?.refrence]);

  @override
  bool isValidKey(Object? o) => o is Emails3Record;
}

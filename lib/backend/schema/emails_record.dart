import 'dart:async';

import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EmailsRecord extends FirestoreRecord {
  EmailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emails');

  static Stream<EmailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmailsRecord.fromSnapshot(s));

  static Future<EmailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmailsRecord.fromSnapshot(s));

  static EmailsRecord fromSnapshot(DocumentSnapshot snapshot) => EmailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmailsRecord._(reference, mapFromFirestore(data));

  static EmailsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EmailsRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'name': snapshot.data['name'],
        },
        EmailsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EmailsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'emails',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EmailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmailsRecordData({
  String? email,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmailsRecordDocumentEquality implements Equality<EmailsRecord> {
  const EmailsRecordDocumentEquality();

  @override
  bool equals(EmailsRecord? e1, EmailsRecord? e2) {
    return e1?.email == e2?.email && e1?.name == e2?.name;
  }

  @override
  int hash(EmailsRecord? e) => const ListEquality().hash([e?.email, e?.name]);

  @override
  bool isValidKey(Object? o) => o is EmailsRecord;
}

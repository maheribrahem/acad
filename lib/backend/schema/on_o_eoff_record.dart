import 'dart:async';

import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OnOEoffRecord extends FirestoreRecord {
  OnOEoffRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "registration" field.
  bool? _registration;
  bool get registration => _registration ?? false;
  bool hasRegistration() => _registration != null;

  // "registrationMessage" field.
  String? _registrationMessage;
  String get registrationMessage => _registrationMessage ?? '';
  bool hasRegistrationMessage() => _registrationMessage != null;

  // "isRegistrationButton" field.
  bool? _isRegistrationButton;
  bool get isRegistrationButton => _isRegistrationButton ?? false;
  bool hasIsRegistrationButton() => _isRegistrationButton != null;

  // "registrationButtonLink" field.
  String? _registrationButtonLink;
  String get registrationButtonLink => _registrationButtonLink ?? '';
  bool hasRegistrationButtonLink() => _registrationButtonLink != null;

  void _initializeFields() {
    _registration = snapshotData['registration'] as bool?;
    _registrationMessage = snapshotData['registrationMessage'] as String?;
    _isRegistrationButton = snapshotData['isRegistrationButton'] as bool?;
    _registrationButtonLink = snapshotData['registrationButtonLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onOEoff');

  static Stream<OnOEoffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnOEoffRecord.fromSnapshot(s));

  static Future<OnOEoffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnOEoffRecord.fromSnapshot(s));

  static OnOEoffRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnOEoffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnOEoffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnOEoffRecord._(reference, mapFromFirestore(data));

  static OnOEoffRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OnOEoffRecord.getDocumentFromData(
        {
          'registration': snapshot.data['registration'],
          'registrationMessage': snapshot.data['registrationMessage'],
          'isRegistrationButton': snapshot.data['isRegistrationButton'],
          'registrationButtonLink': snapshot.data['registrationButtonLink'],
        },
        OnOEoffRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OnOEoffRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'onOEoff',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OnOEoffRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnOEoffRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnOEoffRecordData({
  bool? registration,
  String? registrationMessage,
  bool? isRegistrationButton,
  String? registrationButtonLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'registration': registration,
      'registrationMessage': registrationMessage,
      'isRegistrationButton': isRegistrationButton,
      'registrationButtonLink': registrationButtonLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnOEoffRecordDocumentEquality implements Equality<OnOEoffRecord> {
  const OnOEoffRecordDocumentEquality();

  @override
  bool equals(OnOEoffRecord? e1, OnOEoffRecord? e2) {
    return e1?.registration == e2?.registration &&
        e1?.registrationMessage == e2?.registrationMessage &&
        e1?.isRegistrationButton == e2?.isRegistrationButton &&
        e1?.registrationButtonLink == e2?.registrationButtonLink;
  }

  @override
  int hash(OnOEoffRecord? e) => const ListEquality().hash([
        e?.registration,
        e?.registrationMessage,
        e?.isRegistrationButton,
        e?.registrationButtonLink
      ]);

  @override
  bool isValidKey(Object? o) => o is OnOEoffRecord;
}

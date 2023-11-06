import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QbankAttemptsRecord extends FirestoreRecord {
  QbankAttemptsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "QbankAnswer" field.
  String? _qbankAnswer;
  String get qbankAnswer => _qbankAnswer ?? '';
  bool hasQbankAnswer() => _qbankAnswer != null;

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  // "QbankRef" field.
  DocumentReference? _qbankRef;
  DocumentReference? get qbankRef => _qbankRef;
  bool hasQbankRef() => _qbankRef != null;

  // "QbankActivitRef" field.
  DocumentReference? _qbankActivitRef;
  DocumentReference? get qbankActivitRef => _qbankActivitRef;
  bool hasQbankActivitRef() => _qbankActivitRef != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _qbankAnswer = snapshotData['QbankAnswer'] as String?;
    _isTrue = snapshotData['isTrue'] as bool?;
    _qbankRef = snapshotData['QbankRef'] as DocumentReference?;
    _qbankActivitRef = snapshotData['QbankActivitRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QbankAttempts');

  static Stream<QbankAttemptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QbankAttemptsRecord.fromSnapshot(s));

  static Future<QbankAttemptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QbankAttemptsRecord.fromSnapshot(s));

  static QbankAttemptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QbankAttemptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QbankAttemptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QbankAttemptsRecord._(reference, mapFromFirestore(data));

  static QbankAttemptsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      QbankAttemptsRecord.getDocumentFromData(
        {
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'QbankAnswer': snapshot.data['QbankAnswer'],
          'isTrue': snapshot.data['isTrue'],
          'QbankRef': convertAlgoliaParam(
            snapshot.data['QbankRef'],
            ParamType.DocumentReference,
            false,
          ),
          'QbankActivitRef': convertAlgoliaParam(
            snapshot.data['QbankActivitRef'],
            ParamType.DocumentReference,
            false,
          ),
        },
        QbankAttemptsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<QbankAttemptsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'QbankAttempts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'QbankAttemptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QbankAttemptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQbankAttemptsRecordData({
  DocumentReference? user,
  String? qbankAnswer,
  bool? isTrue,
  DocumentReference? qbankRef,
  DocumentReference? qbankActivitRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'QbankAnswer': qbankAnswer,
      'isTrue': isTrue,
      'QbankRef': qbankRef,
      'QbankActivitRef': qbankActivitRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class QbankAttemptsRecordDocumentEquality
    implements Equality<QbankAttemptsRecord> {
  const QbankAttemptsRecordDocumentEquality();

  @override
  bool equals(QbankAttemptsRecord? e1, QbankAttemptsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.qbankAnswer == e2?.qbankAnswer &&
        e1?.isTrue == e2?.isTrue &&
        e1?.qbankRef == e2?.qbankRef &&
        e1?.qbankActivitRef == e2?.qbankActivitRef;
  }

  @override
  int hash(QbankAttemptsRecord? e) => const ListEquality().hash(
      [e?.user, e?.qbankAnswer, e?.isTrue, e?.qbankRef, e?.qbankActivitRef]);

  @override
  bool isValidKey(Object? o) => o is QbankAttemptsRecord;
}

import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QbankRecord extends FirestoreRecord {
  QbankRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activid" field.
  DocumentReference? _activid;
  DocumentReference? get activid => _activid;
  bool hasActivid() => _activid != null;

  // "Qtext" field.
  String? _qtext;
  String get qtext => _qtext ?? '';
  bool hasQtext() => _qtext != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _activid = snapshotData['activid'] as DocumentReference?;
    _qtext = snapshotData['Qtext'] as String?;
    _options = getDataList(snapshotData['options']);
    _answer = snapshotData['answer'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qbank');

  static Stream<QbankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QbankRecord.fromSnapshot(s));

  static Future<QbankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QbankRecord.fromSnapshot(s));

  static QbankRecord fromSnapshot(DocumentSnapshot snapshot) => QbankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QbankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QbankRecord._(reference, mapFromFirestore(data));

  static QbankRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      QbankRecord.getDocumentFromData(
        {
          'activid': convertAlgoliaParam(
            snapshot.data['activid'],
            ParamType.DocumentReference,
            false,
          ),
          'Qtext': snapshot.data['Qtext'],
          'options': safeGet(
            () => snapshot.data['options'].toList(),
          ),
          'answer': snapshot.data['answer'],
          'order': convertAlgoliaParam(
            snapshot.data['order'],
            ParamType.int,
            false,
          ),
          'time': convertAlgoliaParam(
            snapshot.data['time'],
            ParamType.DateTime,
            false,
          ),
        },
        QbankRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<QbankRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'qbank',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'QbankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QbankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQbankRecordData({
  DocumentReference? activid,
  String? qtext,
  String? answer,
  int? order,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activid': activid,
      'Qtext': qtext,
      'answer': answer,
      'order': order,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class QbankRecordDocumentEquality implements Equality<QbankRecord> {
  const QbankRecordDocumentEquality();

  @override
  bool equals(QbankRecord? e1, QbankRecord? e2) {
    const listEquality = ListEquality();
    return e1?.activid == e2?.activid &&
        e1?.qtext == e2?.qtext &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.answer == e2?.answer &&
        e1?.order == e2?.order &&
        e1?.time == e2?.time;
  }

  @override
  int hash(QbankRecord? e) => const ListEquality()
      .hash([e?.activid, e?.qtext, e?.options, e?.answer, e?.order, e?.time]);

  @override
  bool isValidKey(Object? o) => o is QbankRecord;
}

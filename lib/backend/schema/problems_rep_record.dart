import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProblemsRepRecord extends FirestoreRecord {
  ProblemsRepRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mentorID" field.
  DocumentReference? _mentorID;
  DocumentReference? get mentorID => _mentorID;
  bool hasMentorID() => _mentorID != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "problemText" field.
  String? _problemText;
  String get problemText => _problemText ?? '';
  bool hasProblemText() => _problemText != null;

  // "solving" field.
  bool? _solving;
  bool get solving => _solving ?? false;
  bool hasSolving() => _solving != null;

  // "solved" field.
  bool? _solved;
  bool get solved => _solved ?? false;
  bool hasSolved() => _solved != null;

  // "adminSolver" field.
  DocumentReference? _adminSolver;
  DocumentReference? get adminSolver => _adminSolver;
  bool hasAdminSolver() => _adminSolver != null;

  // "timeRized" field.
  DateTime? _timeRized;
  DateTime? get timeRized => _timeRized;
  bool hasTimeRized() => _timeRized != null;

  // "timeSolved" field.
  DateTime? _timeSolved;
  DateTime? get timeSolved => _timeSolved;
  bool hasTimeSolved() => _timeSolved != null;

  // "isProblem" field.
  bool? _isProblem;
  bool get isProblem => _isProblem ?? false;
  bool hasIsProblem() => _isProblem != null;

  void _initializeFields() {
    _mentorID = snapshotData['mentorID'] as DocumentReference?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _problemText = snapshotData['problemText'] as String?;
    _solving = snapshotData['solving'] as bool?;
    _solved = snapshotData['solved'] as bool?;
    _adminSolver = snapshotData['adminSolver'] as DocumentReference?;
    _timeRized = snapshotData['timeRized'] as DateTime?;
    _timeSolved = snapshotData['timeSolved'] as DateTime?;
    _isProblem = snapshotData['isProblem'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('problemsRep');

  static Stream<ProblemsRepRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProblemsRepRecord.fromSnapshot(s));

  static Future<ProblemsRepRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProblemsRepRecord.fromSnapshot(s));

  static ProblemsRepRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProblemsRepRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProblemsRepRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProblemsRepRecord._(reference, mapFromFirestore(data));

  static ProblemsRepRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProblemsRepRecord.getDocumentFromData(
        {
          'mentorID': convertAlgoliaParam(
            snapshot.data['mentorID'],
            ParamType.DocumentReference,
            false,
          ),
          'userID': convertAlgoliaParam(
            snapshot.data['userID'],
            ParamType.DocumentReference,
            false,
          ),
          'problemText': snapshot.data['problemText'],
          'solving': snapshot.data['solving'],
          'solved': snapshot.data['solved'],
          'adminSolver': convertAlgoliaParam(
            snapshot.data['adminSolver'],
            ParamType.DocumentReference,
            false,
          ),
          'timeRized': convertAlgoliaParam(
            snapshot.data['timeRized'],
            ParamType.DateTime,
            false,
          ),
          'timeSolved': convertAlgoliaParam(
            snapshot.data['timeSolved'],
            ParamType.DateTime,
            false,
          ),
          'isProblem': snapshot.data['isProblem'],
        },
        ProblemsRepRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProblemsRepRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'problemsRep',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProblemsRepRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProblemsRepRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProblemsRepRecordData({
  DocumentReference? mentorID,
  DocumentReference? userID,
  String? problemText,
  bool? solving,
  bool? solved,
  DocumentReference? adminSolver,
  DateTime? timeRized,
  DateTime? timeSolved,
  bool? isProblem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mentorID': mentorID,
      'userID': userID,
      'problemText': problemText,
      'solving': solving,
      'solved': solved,
      'adminSolver': adminSolver,
      'timeRized': timeRized,
      'timeSolved': timeSolved,
      'isProblem': isProblem,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProblemsRepRecordDocumentEquality implements Equality<ProblemsRepRecord> {
  const ProblemsRepRecordDocumentEquality();

  @override
  bool equals(ProblemsRepRecord? e1, ProblemsRepRecord? e2) {
    return e1?.mentorID == e2?.mentorID &&
        e1?.userID == e2?.userID &&
        e1?.problemText == e2?.problemText &&
        e1?.solving == e2?.solving &&
        e1?.solved == e2?.solved &&
        e1?.adminSolver == e2?.adminSolver &&
        e1?.timeRized == e2?.timeRized &&
        e1?.timeSolved == e2?.timeSolved &&
        e1?.isProblem == e2?.isProblem;
  }

  @override
  int hash(ProblemsRepRecord? e) => const ListEquality().hash([
        e?.mentorID,
        e?.userID,
        e?.problemText,
        e?.solving,
        e?.solved,
        e?.adminSolver,
        e?.timeRized,
        e?.timeSolved,
        e?.isProblem
      ]);

  @override
  bool isValidKey(Object? o) => o is ProblemsRepRecord;
}

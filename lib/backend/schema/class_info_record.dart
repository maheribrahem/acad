import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassInfoRecord extends FirestoreRecord {
  ClassInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "className" field.
  String? _className;
  String get className => _className ?? '';
  bool hasClassName() => _className != null;

  // "classID" field.
  String? _classID;
  String get classID => _classID ?? '';
  bool hasClassID() => _classID != null;

  // "classImage" field.
  String? _classImage;
  String get classImage => _classImage ?? '';
  bool hasClassImage() => _classImage != null;

  // "classVod" field.
  String? _classVod;
  String get classVod => _classVod ?? '';
  bool hasClassVod() => _classVod != null;

  // "classAud" field.
  String? _classAud;
  String get classAud => _classAud ?? '';
  bool hasClassAud() => _classAud != null;

  // "classSuperior" field.
  String? _classSuperior;
  String get classSuperior => _classSuperior ?? '';
  bool hasClassSuperior() => _classSuperior != null;

  // "classDoc" field.
  String? _classDoc;
  String get classDoc => _classDoc ?? '';
  bool hasClassDoc() => _classDoc != null;

  void _initializeFields() {
    _className = snapshotData['className'] as String?;
    _classID = snapshotData['classID'] as String?;
    _classImage = snapshotData['classImage'] as String?;
    _classVod = snapshotData['classVod'] as String?;
    _classAud = snapshotData['classAud'] as String?;
    _classSuperior = snapshotData['classSuperior'] as String?;
    _classDoc = snapshotData['classDoc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classInfo');

  static Stream<ClassInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassInfoRecord.fromSnapshot(s));

  static Future<ClassInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassInfoRecord.fromSnapshot(s));

  static ClassInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassInfoRecord._(reference, mapFromFirestore(data));

  static ClassInfoRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ClassInfoRecord.getDocumentFromData(
        {
          'className': snapshot.data['className'],
          'classID': snapshot.data['classID'],
          'classImage': snapshot.data['classImage'],
          'classVod': snapshot.data['classVod'],
          'classAud': snapshot.data['classAud'],
          'classSuperior': snapshot.data['classSuperior'],
          'classDoc': snapshot.data['classDoc'],
        },
        ClassInfoRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ClassInfoRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'classInfo',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ClassInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassInfoRecordData({
  String? className,
  String? classID,
  String? classImage,
  String? classVod,
  String? classAud,
  String? classSuperior,
  String? classDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'className': className,
      'classID': classID,
      'classImage': classImage,
      'classVod': classVod,
      'classAud': classAud,
      'classSuperior': classSuperior,
      'classDoc': classDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassInfoRecordDocumentEquality implements Equality<ClassInfoRecord> {
  const ClassInfoRecordDocumentEquality();

  @override
  bool equals(ClassInfoRecord? e1, ClassInfoRecord? e2) {
    return e1?.className == e2?.className &&
        e1?.classID == e2?.classID &&
        e1?.classImage == e2?.classImage &&
        e1?.classVod == e2?.classVod &&
        e1?.classAud == e2?.classAud &&
        e1?.classSuperior == e2?.classSuperior &&
        e1?.classDoc == e2?.classDoc;
  }

  @override
  int hash(ClassInfoRecord? e) => const ListEquality().hash([
        e?.className,
        e?.classID,
        e?.classImage,
        e?.classVod,
        e?.classAud,
        e?.classSuperior,
        e?.classDoc
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassInfoRecord;
}

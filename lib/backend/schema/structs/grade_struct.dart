// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradeStruct extends FFFirebaseStruct {
  GradeStruct({
    String? ictivID,
    String? activiName,
    double? activGrade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ictivID = ictivID,
        _activiName = activiName,
        _activGrade = activGrade,
        super(firestoreUtilData);

  // "ictivID" field.
  String? _ictivID;
  String get ictivID => _ictivID ?? '';
  set ictivID(String? val) => _ictivID = val;
  bool hasIctivID() => _ictivID != null;

  // "activiName" field.
  String? _activiName;
  String get activiName => _activiName ?? '';
  set activiName(String? val) => _activiName = val;
  bool hasActiviName() => _activiName != null;

  // "activGrade" field.
  double? _activGrade;
  double get activGrade => _activGrade ?? 0.0;
  set activGrade(double? val) => _activGrade = val;
  void incrementActivGrade(double amount) => _activGrade = activGrade + amount;
  bool hasActivGrade() => _activGrade != null;

  static GradeStruct fromMap(Map<String, dynamic> data) => GradeStruct(
        ictivID: data['ictivID'] as String?,
        activiName: data['activiName'] as String?,
        activGrade: castToType<double>(data['activGrade']),
      );

  static GradeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GradeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ictivID': _ictivID,
        'activiName': _activiName,
        'activGrade': _activGrade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ictivID': serializeParam(
          _ictivID,
          ParamType.String,
        ),
        'activiName': serializeParam(
          _activiName,
          ParamType.String,
        ),
        'activGrade': serializeParam(
          _activGrade,
          ParamType.double,
        ),
      }.withoutNulls;

  static GradeStruct fromSerializableMap(Map<String, dynamic> data) =>
      GradeStruct(
        ictivID: deserializeParam(
          data['ictivID'],
          ParamType.String,
          false,
        ),
        activiName: deserializeParam(
          data['activiName'],
          ParamType.String,
          false,
        ),
        activGrade: deserializeParam(
          data['activGrade'],
          ParamType.double,
          false,
        ),
      );

  static GradeStruct fromAlgoliaData(Map<String, dynamic> data) => GradeStruct(
        ictivID: convertAlgoliaParam(
          data['ictivID'],
          ParamType.String,
          false,
        ),
        activiName: convertAlgoliaParam(
          data['activiName'],
          ParamType.String,
          false,
        ),
        activGrade: convertAlgoliaParam(
          data['activGrade'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GradeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GradeStruct &&
        ictivID == other.ictivID &&
        activiName == other.activiName &&
        activGrade == other.activGrade;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ictivID, activiName, activGrade]);
}

GradeStruct createGradeStruct({
  String? ictivID,
  String? activiName,
  double? activGrade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GradeStruct(
      ictivID: ictivID,
      activiName: activiName,
      activGrade: activGrade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GradeStruct? updateGradeStruct(
  GradeStruct? grade, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    grade
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGradeStructData(
  Map<String, dynamic> firestoreData,
  GradeStruct? grade,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (grade == null) {
    return;
  }
  if (grade.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && grade.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gradeData = getGradeFirestoreData(grade, forFieldValue);
  final nestedData = gradeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = grade.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGradeFirestoreData(
  GradeStruct? grade, [
  bool forFieldValue = false,
]) {
  if (grade == null) {
    return {};
  }
  final firestoreData = mapToFirestore(grade.toMap());

  // Add any Firestore field values
  grade.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGradeListFirestoreData(
  List<GradeStruct>? grades,
) =>
    grades?.map((e) => getGradeFirestoreData(e, true)).toList() ?? [];

// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradesStruct extends FFFirebaseStruct {
  GradesStruct({
    String? userName,
    String? userEmail,
    String? uid,
    String? userMentor,
    List<GradeStruct>? grades,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userName = userName,
        _userEmail = userEmail,
        _uid = uid,
        _userMentor = userMentor,
        _grades = grades,
        super(firestoreUtilData);

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;
  bool hasUserEmail() => _userEmail != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "userMentor" field.
  String? _userMentor;
  String get userMentor => _userMentor ?? '';
  set userMentor(String? val) => _userMentor = val;
  bool hasUserMentor() => _userMentor != null;

  // "grades" field.
  List<GradeStruct>? _grades;
  List<GradeStruct> get grades => _grades ?? const [];
  set grades(List<GradeStruct>? val) => _grades = val;
  void updateGrades(Function(List<GradeStruct>) updateFn) =>
      updateFn(_grades ??= []);
  bool hasGrades() => _grades != null;

  static GradesStruct fromMap(Map<String, dynamic> data) => GradesStruct(
        userName: data['userName'] as String?,
        userEmail: data['userEmail'] as String?,
        uid: data['UID'] as String?,
        userMentor: data['userMentor'] as String?,
        grades: getStructList(
          data['grades'],
          GradeStruct.fromMap,
        ),
      );

  static GradesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GradesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'userName': _userName,
        'userEmail': _userEmail,
        'UID': _uid,
        'userMentor': _userMentor,
        'grades': _grades?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userEmail': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'UID': serializeParam(
          _uid,
          ParamType.String,
        ),
        'userMentor': serializeParam(
          _userMentor,
          ParamType.String,
        ),
        'grades': serializeParam(
          _grades,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static GradesStruct fromSerializableMap(Map<String, dynamic> data) =>
      GradesStruct(
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['userEmail'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['UID'],
          ParamType.String,
          false,
        ),
        userMentor: deserializeParam(
          data['userMentor'],
          ParamType.String,
          false,
        ),
        grades: deserializeStructParam<GradeStruct>(
          data['grades'],
          ParamType.DataStruct,
          true,
          structBuilder: GradeStruct.fromSerializableMap,
        ),
      );

  static GradesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GradesStruct(
        userName: convertAlgoliaParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userEmail: convertAlgoliaParam(
          data['userEmail'],
          ParamType.String,
          false,
        ),
        uid: convertAlgoliaParam(
          data['UID'],
          ParamType.String,
          false,
        ),
        userMentor: convertAlgoliaParam(
          data['userMentor'],
          ParamType.String,
          false,
        ),
        grades: convertAlgoliaParam<GradeStruct>(
          data['grades'],
          ParamType.DataStruct,
          true,
          structBuilder: GradeStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GradesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GradesStruct &&
        userName == other.userName &&
        userEmail == other.userEmail &&
        uid == other.uid &&
        userMentor == other.userMentor &&
        listEquality.equals(grades, other.grades);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userName, userEmail, uid, userMentor, grades]);
}

GradesStruct createGradesStruct({
  String? userName,
  String? userEmail,
  String? uid,
  String? userMentor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GradesStruct(
      userName: userName,
      userEmail: userEmail,
      uid: uid,
      userMentor: userMentor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GradesStruct? updateGradesStruct(
  GradesStruct? gradesStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gradesStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGradesStructData(
  Map<String, dynamic> firestoreData,
  GradesStruct? gradesStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gradesStruct == null) {
    return;
  }
  if (gradesStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gradesStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gradesStructData = getGradesFirestoreData(gradesStruct, forFieldValue);
  final nestedData =
      gradesStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gradesStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGradesFirestoreData(
  GradesStruct? gradesStruct, [
  bool forFieldValue = false,
]) {
  if (gradesStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gradesStruct.toMap());

  // Add any Firestore field values
  gradesStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGradesListFirestoreData(
  List<GradesStruct>? gradesStructs,
) =>
    gradesStructs?.map((e) => getGradesFirestoreData(e, true)).toList() ?? [];

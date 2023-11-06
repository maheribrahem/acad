// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersMentorStruct extends FFFirebaseStruct {
  UsersMentorStruct({
    DocumentReference? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  static UsersMentorStruct fromMap(Map<String, dynamic> data) =>
      UsersMentorStruct(
        user: data['user'] as DocumentReference?,
      );

  static UsersMentorStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UsersMentorStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UsersMentorStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersMentorStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static UsersMentorStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UsersMentorStruct(
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UsersMentorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersMentorStruct && user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash([user]);
}

UsersMentorStruct createUsersMentorStruct({
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersMentorStruct(
      user: user,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersMentorStruct? updateUsersMentorStruct(
  UsersMentorStruct? usersMentor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersMentor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersMentorStructData(
  Map<String, dynamic> firestoreData,
  UsersMentorStruct? usersMentor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersMentor == null) {
    return;
  }
  if (usersMentor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usersMentor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersMentorData =
      getUsersMentorFirestoreData(usersMentor, forFieldValue);
  final nestedData =
      usersMentorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usersMentor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersMentorFirestoreData(
  UsersMentorStruct? usersMentor, [
  bool forFieldValue = false,
]) {
  if (usersMentor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersMentor.toMap());

  // Add any Firestore field values
  usersMentor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersMentorListFirestoreData(
  List<UsersMentorStruct>? usersMentors,
) =>
    usersMentors?.map((e) => getUsersMentorFirestoreData(e, true)).toList() ??
    [];

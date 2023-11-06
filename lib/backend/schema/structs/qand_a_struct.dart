// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QandAStruct extends FFFirebaseStruct {
  QandAStruct({
    String? answer,
    String? qID,
    bool? isTrue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        _qID = qID,
        _isTrue = isTrue,
        super(firestoreUtilData);

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  // "qID" field.
  String? _qID;
  String get qID => _qID ?? '';
  set qID(String? val) => _qID = val;
  bool hasQID() => _qID != null;

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  set isTrue(bool? val) => _isTrue = val;
  bool hasIsTrue() => _isTrue != null;

  static QandAStruct fromMap(Map<String, dynamic> data) => QandAStruct(
        answer: data['answer'] as String?,
        qID: data['qID'] as String?,
        isTrue: data['isTrue'] as bool?,
      );

  static QandAStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QandAStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'answer': _answer,
        'qID': _qID,
        'isTrue': _isTrue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'qID': serializeParam(
          _qID,
          ParamType.String,
        ),
        'isTrue': serializeParam(
          _isTrue,
          ParamType.bool,
        ),
      }.withoutNulls;

  static QandAStruct fromSerializableMap(Map<String, dynamic> data) =>
      QandAStruct(
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        qID: deserializeParam(
          data['qID'],
          ParamType.String,
          false,
        ),
        isTrue: deserializeParam(
          data['isTrue'],
          ParamType.bool,
          false,
        ),
      );

  static QandAStruct fromAlgoliaData(Map<String, dynamic> data) => QandAStruct(
        answer: convertAlgoliaParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        qID: convertAlgoliaParam(
          data['qID'],
          ParamType.String,
          false,
        ),
        isTrue: convertAlgoliaParam(
          data['isTrue'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'QandAStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QandAStruct &&
        answer == other.answer &&
        qID == other.qID &&
        isTrue == other.isTrue;
  }

  @override
  int get hashCode => const ListEquality().hash([answer, qID, isTrue]);
}

QandAStruct createQandAStruct({
  String? answer,
  String? qID,
  bool? isTrue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QandAStruct(
      answer: answer,
      qID: qID,
      isTrue: isTrue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QandAStruct? updateQandAStruct(
  QandAStruct? qandA, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qandA
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQandAStructData(
  Map<String, dynamic> firestoreData,
  QandAStruct? qandA,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qandA == null) {
    return;
  }
  if (qandA.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qandA.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qandAData = getQandAFirestoreData(qandA, forFieldValue);
  final nestedData = qandAData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qandA.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQandAFirestoreData(
  QandAStruct? qandA, [
  bool forFieldValue = false,
]) {
  if (qandA == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qandA.toMap());

  // Add any Firestore field values
  qandA.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQandAListFirestoreData(
  List<QandAStruct>? qandAs,
) =>
    qandAs?.map((e) => getQandAFirestoreData(e, true)).toList() ?? [];

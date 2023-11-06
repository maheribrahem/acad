// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradingExtrasStruct extends FFFirebaseStruct {
  GradingExtrasStruct({
    String? name,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  static GradingExtrasStruct fromMap(Map<String, dynamic> data) =>
      GradingExtrasStruct(
        name: data['name'] as String?,
        number: castToType<int>(data['number']),
      );

  static GradingExtrasStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GradingExtrasStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static GradingExtrasStruct fromSerializableMap(Map<String, dynamic> data) =>
      GradingExtrasStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  static GradingExtrasStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GradingExtrasStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: convertAlgoliaParam(
          data['number'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GradingExtrasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GradingExtrasStruct &&
        name == other.name &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([name, number]);
}

GradingExtrasStruct createGradingExtrasStruct({
  String? name,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GradingExtrasStruct(
      name: name,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GradingExtrasStruct? updateGradingExtrasStruct(
  GradingExtrasStruct? gradingExtras, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gradingExtras
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGradingExtrasStructData(
  Map<String, dynamic> firestoreData,
  GradingExtrasStruct? gradingExtras,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gradingExtras == null) {
    return;
  }
  if (gradingExtras.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gradingExtras.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gradingExtrasData =
      getGradingExtrasFirestoreData(gradingExtras, forFieldValue);
  final nestedData =
      gradingExtrasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gradingExtras.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGradingExtrasFirestoreData(
  GradingExtrasStruct? gradingExtras, [
  bool forFieldValue = false,
]) {
  if (gradingExtras == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gradingExtras.toMap());

  // Add any Firestore field values
  gradingExtras.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGradingExtrasListFirestoreData(
  List<GradingExtrasStruct>? gradingExtrass,
) =>
    gradingExtrass
        ?.map((e) => getGradingExtrasFirestoreData(e, true))
        .toList() ??
    [];

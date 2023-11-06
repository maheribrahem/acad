// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubTotalStruct extends FFFirebaseStruct {
  SubTotalStruct({
    DocumentReference? categ,
    int? sum,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categ = categ,
        _sum = sum,
        super(firestoreUtilData);

  // "categ" field.
  DocumentReference? _categ;
  DocumentReference? get categ => _categ;
  set categ(DocumentReference? val) => _categ = val;
  bool hasCateg() => _categ != null;

  // "sum" field.
  int? _sum;
  int get sum => _sum ?? 0;
  set sum(int? val) => _sum = val;
  void incrementSum(int amount) => _sum = sum + amount;
  bool hasSum() => _sum != null;

  static SubTotalStruct fromMap(Map<String, dynamic> data) => SubTotalStruct(
        categ: data['categ'] as DocumentReference?,
        sum: castToType<int>(data['sum']),
      );

  static SubTotalStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SubTotalStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'categ': _categ,
        'sum': _sum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categ': serializeParam(
          _categ,
          ParamType.DocumentReference,
        ),
        'sum': serializeParam(
          _sum,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubTotalStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubTotalStruct(
        categ: deserializeParam(
          data['categ'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['categ'],
        ),
        sum: deserializeParam(
          data['sum'],
          ParamType.int,
          false,
        ),
      );

  static SubTotalStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubTotalStruct(
        categ: convertAlgoliaParam(
          data['categ'],
          ParamType.DocumentReference,
          false,
        ),
        sum: convertAlgoliaParam(
          data['sum'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubTotalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubTotalStruct && categ == other.categ && sum == other.sum;
  }

  @override
  int get hashCode => const ListEquality().hash([categ, sum]);
}

SubTotalStruct createSubTotalStruct({
  DocumentReference? categ,
  int? sum,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubTotalStruct(
      categ: categ,
      sum: sum,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubTotalStruct? updateSubTotalStruct(
  SubTotalStruct? subTotal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subTotal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubTotalStructData(
  Map<String, dynamic> firestoreData,
  SubTotalStruct? subTotal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subTotal == null) {
    return;
  }
  if (subTotal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subTotal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subTotalData = getSubTotalFirestoreData(subTotal, forFieldValue);
  final nestedData = subTotalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subTotal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubTotalFirestoreData(
  SubTotalStruct? subTotal, [
  bool forFieldValue = false,
]) {
  if (subTotal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subTotal.toMap());

  // Add any Firestore field values
  subTotal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubTotalListFirestoreData(
  List<SubTotalStruct>? subTotals,
) =>
    subTotals?.map((e) => getSubTotalFirestoreData(e, true)).toList() ?? [];

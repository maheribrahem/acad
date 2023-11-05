// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShowAndHideStruct extends FFFirebaseStruct {
  ShowAndHideStruct({
    bool? show,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _show = show,
        _text = text,
        super(firestoreUtilData);

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  set show(bool? val) => _show = val;
  bool hasShow() => _show != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  static ShowAndHideStruct fromMap(Map<String, dynamic> data) =>
      ShowAndHideStruct(
        show: data['show'] as bool?,
        text: data['text'] as String?,
      );

  static ShowAndHideStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ShowAndHideStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'show': _show,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'show': serializeParam(
          _show,
          ParamType.bool,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShowAndHideStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShowAndHideStruct(
        show: deserializeParam(
          data['show'],
          ParamType.bool,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  static ShowAndHideStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ShowAndHideStruct(
        show: convertAlgoliaParam(
          data['show'],
          ParamType.bool,
          false,
        ),
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ShowAndHideStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShowAndHideStruct &&
        show == other.show &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([show, text]);
}

ShowAndHideStruct createShowAndHideStruct({
  bool? show,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShowAndHideStruct(
      show: show,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShowAndHideStruct? updateShowAndHideStruct(
  ShowAndHideStruct? showAndHide, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    showAndHide
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShowAndHideStructData(
  Map<String, dynamic> firestoreData,
  ShowAndHideStruct? showAndHide,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (showAndHide == null) {
    return;
  }
  if (showAndHide.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && showAndHide.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final showAndHideData =
      getShowAndHideFirestoreData(showAndHide, forFieldValue);
  final nestedData =
      showAndHideData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = showAndHide.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShowAndHideFirestoreData(
  ShowAndHideStruct? showAndHide, [
  bool forFieldValue = false,
]) {
  if (showAndHide == null) {
    return {};
  }
  final firestoreData = mapToFirestore(showAndHide.toMap());

  // Add any Firestore field values
  showAndHide.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShowAndHideListFirestoreData(
  List<ShowAndHideStruct>? showAndHides,
) =>
    showAndHides?.map((e) => getShowAndHideFirestoreData(e, true)).toList() ??
    [];

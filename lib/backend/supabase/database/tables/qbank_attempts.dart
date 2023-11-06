import '../database.dart';

class QbankAttemptsTable extends SupabaseTable<QbankAttemptsRow> {
  @override
  String get tableName => 'QbankAttempts';

  @override
  QbankAttemptsRow createRow(Map<String, dynamic> data) =>
      QbankAttemptsRow(data);
}

class QbankAttemptsRow extends SupabaseDataRow {
  QbankAttemptsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QbankAttemptsTable();

  String get id => getField<String>('ID')!;
  set id(String value) => setField<String>('ID', value);

  String? get qbankActivitID => getField<String>('QbankActivitID');
  set qbankActivitID(String? value) =>
      setField<String>('QbankActivitID', value);

  String? get qbankAnswer => getField<String>('QbankAnswer');
  set qbankAnswer(String? value) => setField<String>('QbankAnswer', value);

  String? get qbankID => getField<String>('QbankID');
  set qbankID(String? value) => setField<String>('QbankID', value);

  bool? get isTrue => getField<bool>('isTrue');
  set isTrue(bool? value) => setField<bool>('isTrue', value);

  String? get usersID => getField<String>('usersID');
  set usersID(String? value) => setField<String>('usersID', value);

  DateTime? get when => getField<DateTime>('when');
  set when(DateTime? value) => setField<DateTime>('when', value);
}

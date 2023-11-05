import '../database.dart';

class QbankAttemptTable extends SupabaseTable<QbankAttemptRow> {
  @override
  String get tableName => 'QbankAttempt';

  @override
  QbankAttemptRow createRow(Map<String, dynamic> data) => QbankAttemptRow(data);
}

class QbankAttemptRow extends SupabaseDataRow {
  QbankAttemptRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QbankAttemptTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);

  String? get testID => getField<String>('testID');
  set testID(String? value) => setField<String>('testID', value);

  List<dynamic> get answers => getListField<dynamic>('answers');
  set answers(List<dynamic>? value) => setListField<dynamic>('answers', value);
}

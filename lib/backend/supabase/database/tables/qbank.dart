import '../database.dart';

class QbankTable extends SupabaseTable<QbankRow> {
  @override
  String get tableName => 'Qbank';

  @override
  QbankRow createRow(Map<String, dynamic> data) => QbankRow(data);
}

class QbankRow extends SupabaseDataRow {
  QbankRow(super.data);

  @override
  SupabaseTable get table => QbankTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get activID => getField<String>('activID');
  set activID(String? value) => setField<String>('activID', value);

  String? get qtext => getField<String>('Qtext');
  set qtext(String? value) => setField<String>('Qtext', value);

  dynamic get options => getField<dynamic>('options');
  set options(dynamic value) => setField<dynamic>('options', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  DateTime? get time => getField<DateTime>('time');
  set time(DateTime? value) => setField<DateTime>('time', value);
}

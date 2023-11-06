import '../database.dart';

class ActivitiesProgressTable extends SupabaseTable<ActivitiesProgressRow> {
  @override
  String get tableName => 'activitiesProgress';

  @override
  ActivitiesProgressRow createRow(Map<String, dynamic> data) =>
      ActivitiesProgressRow(data);
}

class ActivitiesProgressRow extends SupabaseDataRow {
  ActivitiesProgressRow(super.data);

  @override
  SupabaseTable get table => ActivitiesProgressTable();

  String get id => getField<String>('ID')!;
  set id(String value) => setField<String>('ID', value);

  String? get activitID => getField<String>('activitID');
  set activitID(String? value) => setField<String>('activitID', value);

  double? get grade => getField<double>('grade');
  set grade(double? value) => setField<double>('grade', value);

  bool? get isAttended => getField<bool>('isAttended');
  set isAttended(bool? value) => setField<bool>('isAttended', value);

  bool? get isDone => getField<bool>('isDone');
  set isDone(bool? value) => setField<bool>('isDone', value);

  bool? get isSeen => getField<bool>('isSeen');
  set isSeen(bool? value) => setField<bool>('isSeen', value);

  String? get supjID => getField<String>('supjID');
  set supjID(String? value) => setField<String>('supjID', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);

  DateTime? get when => getField<DateTime>('when');
  set when(DateTime? value) => setField<DateTime>('when', value);

  String? get categID => getField<String>('categID');
  set categID(String? value) => setField<String>('categID', value);
}

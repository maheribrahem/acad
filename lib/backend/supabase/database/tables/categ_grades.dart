import '../database.dart';

class CategGradesTable extends SupabaseTable<CategGradesRow> {
  @override
  String get tableName => 'categGrades';

  @override
  CategGradesRow createRow(Map<String, dynamic> data) => CategGradesRow(data);
}

class CategGradesRow extends SupabaseDataRow {
  CategGradesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CategGradesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get categID => getField<String>('categID');
  set categID(String? value) => setField<String>('categID', value);

  String? get cohortID => getField<String>('cohortID');
  set cohortID(String? value) => setField<String>('cohortID', value);

  String? get userREF => getField<String>('userREF');
  set userREF(String? value) => setField<String>('userREF', value);

  String? get uid => getField<String>('UID');
  set uid(String? value) => setField<String>('UID', value);

  int? get grade => getField<int>('grade');
  set grade(int? value) => setField<int>('grade', value);

  String? get gpa => getField<String>('GPA');
  set gpa(String? value) => setField<String>('GPA', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  int? get exams => getField<int>('exams');
  set exams(int? value) => setField<int>('exams', value);

  int? get exercise => getField<int>('exercise');
  set exercise(int? value) => setField<int>('exercise', value);

  int? get attend => getField<int>('attend');
  set attend(int? value) => setField<int>('attend', value);

  int? get quran => getField<int>('quran');
  set quran(int? value) => setField<int>('quran', value);

  int? get extra => getField<int>('extra');
  set extra(int? value) => setField<int>('extra', value);
}

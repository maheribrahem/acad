import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get documentID => getField<String>('DocumentID');
  set documentID(String? value) => setField<String>('DocumentID', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  DateTime? get born => getField<DateTime>('born');
  set born(DateTime? value) => setField<DateTime>('born', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get cohorts => getField<String>('cohorts');
  set cohorts(String? value) => setField<String>('cohorts', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get fullname => getField<String>('fullname');
  set fullname(String? value) => setField<String>('fullname', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  bool? get isAdmin => getField<bool>('isAdmin');
  set isAdmin(bool? value) => setField<bool>('isAdmin', value);

  bool? get isChecked => getField<bool>('isChecked');
  set isChecked(bool? value) => setField<bool>('isChecked', value);

  bool? get isCompleted => getField<bool>('isCompleted');
  set isCompleted(bool? value) => setField<bool>('isCompleted', value);

  bool? get isReal => getField<bool>('isReal');
  set isReal(bool? value) => setField<bool>('isReal', value);

  String? get job => getField<String>('job');
  set job(String? value) => setField<String>('job', value);

  String? get mentoor => getField<String>('mentoor');
  set mentoor(String? value) => setField<String>('mentoor', value);

  String? get pastStudy => getField<String>('past_study');
  set pastStudy(String? value) => setField<String>('past_study', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get quranJuz => getField<String>('quran_juz');
  set quranJuz(String? value) => setField<String>('quran_juz', value);

  String? get referral => getField<String>('referral');
  set referral(String? value) => setField<String>('referral', value);

  String? get schoolLevel => getField<String>('school_level');
  set schoolLevel(String? value) => setField<String>('school_level', value);

  String? get socialStatus => getField<String>('social_status');
  set socialStatus(String? value) => setField<String>('social_status', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  String? get telegram => getField<String>('telegram');
  set telegram(String? value) => setField<String>('telegram', value);

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);

  String? get phoneNum => getField<String>('phone_num');
  set phoneNum(String? value) => setField<String>('phone_num', value);
}

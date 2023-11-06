import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "born" field.
  DateTime? _born;
  DateTime? get born => _born;
  bool hasBorn() => _born != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "school_level" field.
  String? _schoolLevel;
  String get schoolLevel => _schoolLevel ?? '';
  bool hasSchoolLevel() => _schoolLevel != null;

  // "job" field.
  String? _job;
  String get job => _job ?? '';
  bool hasJob() => _job != null;

  // "social_status" field.
  String? _socialStatus;
  String get socialStatus => _socialStatus ?? '';
  bool hasSocialStatus() => _socialStatus != null;

  // "past_study" field.
  String? _pastStudy;
  String get pastStudy => _pastStudy ?? '';
  bool hasPastStudy() => _pastStudy != null;

  // "referral" field.
  String? _referral;
  String get referral => _referral ?? '';
  bool hasReferral() => _referral != null;

  // "quran_juz" field.
  String? _quranJuz;
  String get quranJuz => _quranJuz ?? '';
  bool hasQuranJuz() => _quranJuz != null;

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  bool hasTelegram() => _telegram != null;

  // "issuspended" field.
  bool? _issuspended;
  bool get issuspended => _issuspended ?? false;
  bool hasIssuspended() => _issuspended != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isTeacher" field.
  bool? _isTeacher;
  bool get isTeacher => _isTeacher ?? false;
  bool hasIsTeacher() => _isTeacher != null;

  // "isSuper" field.
  bool? _isSuper;
  bool get isSuper => _isSuper ?? false;
  bool hasIsSuper() => _isSuper != null;

  // "mentor" field.
  DocumentReference? _mentor;
  DocumentReference? get mentor => _mentor;
  bool hasMentor() => _mentor != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "isReal" field.
  bool? _isReal;
  bool get isReal => _isReal ?? false;
  bool hasIsReal() => _isReal != null;

  // "isChecked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  bool hasIsChecked() => _isChecked != null;

  // "mentoor" field.
  String? _mentoor;
  String get mentoor => _mentoor ?? '';
  bool hasMentoor() => _mentoor != null;

  // "mentoorr" field.
  List<String>? _mentoorr;
  List<String> get mentoorr => _mentoorr ?? const [];
  bool hasMentoorr() => _mentoorr != null;

  // "searchTags" field.
  List<String>? _searchTags;
  List<String> get searchTags => _searchTags ?? const [];
  bool hasSearchTags() => _searchTags != null;

  // "cohorts" field.
  List<DocumentReference>? _cohorts;
  List<DocumentReference> get cohorts => _cohorts ?? const [];
  bool hasCohorts() => _cohorts != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _born = snapshotData['born'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _gender = snapshotData['gender'] as String?;
    _fullname = snapshotData['fullname'] as String?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _schoolLevel = snapshotData['school_level'] as String?;
    _job = snapshotData['job'] as String?;
    _socialStatus = snapshotData['social_status'] as String?;
    _pastStudy = snapshotData['past_study'] as String?;
    _referral = snapshotData['referral'] as String?;
    _quranJuz = snapshotData['quran_juz'] as String?;
    _telegram = snapshotData['telegram'] as String?;
    _issuspended = snapshotData['issuspended'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isTeacher = snapshotData['isTeacher'] as bool?;
    _isSuper = snapshotData['isSuper'] as bool?;
    _mentor = snapshotData['mentor'] as DocumentReference?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _isReal = snapshotData['isReal'] as bool?;
    _isChecked = snapshotData['isChecked'] as bool?;
    _mentoor = snapshotData['mentoor'] as String?;
    _mentoorr = getDataList(snapshotData['mentoorr']);
    _searchTags = getDataList(snapshotData['searchTags']);
    _cohorts = getDataList(snapshotData['cohorts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'born': convertAlgoliaParam(
            snapshot.data['born'],
            ParamType.DateTime,
            false,
          ),
          'address': snapshot.data['address'],
          'gender': snapshot.data['gender'],
          'fullname': snapshot.data['fullname'],
          'state': snapshot.data['state'],
          'city': snapshot.data['city'],
          'school_level': snapshot.data['school_level'],
          'job': snapshot.data['job'],
          'social_status': snapshot.data['social_status'],
          'past_study': snapshot.data['past_study'],
          'referral': snapshot.data['referral'],
          'quran_juz': snapshot.data['quran_juz'],
          'telegram': snapshot.data['telegram'],
          'issuspended': snapshot.data['issuspended'],
          'isAdmin': snapshot.data['isAdmin'],
          'isTeacher': snapshot.data['isTeacher'],
          'isSuper': snapshot.data['isSuper'],
          'mentor': convertAlgoliaParam(
            snapshot.data['mentor'],
            ParamType.DocumentReference,
            false,
          ),
          'isCompleted': snapshot.data['isCompleted'],
          'isReal': snapshot.data['isReal'],
          'isChecked': snapshot.data['isChecked'],
          'mentoor': snapshot.data['mentoor'],
          'mentoorr': safeGet(
            () => snapshot.data['mentoorr'].toList(),
          ),
          'searchTags': safeGet(
            () => snapshot.data['searchTags'].toList(),
          ),
          'cohorts': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['cohorts'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? born,
  String? address,
  String? gender,
  String? fullname,
  String? state,
  String? city,
  String? schoolLevel,
  String? job,
  String? socialStatus,
  String? pastStudy,
  String? referral,
  String? quranJuz,
  String? telegram,
  bool? issuspended,
  bool? isAdmin,
  bool? isTeacher,
  bool? isSuper,
  DocumentReference? mentor,
  bool? isCompleted,
  bool? isReal,
  bool? isChecked,
  String? mentoor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'born': born,
      'address': address,
      'gender': gender,
      'fullname': fullname,
      'state': state,
      'city': city,
      'school_level': schoolLevel,
      'job': job,
      'social_status': socialStatus,
      'past_study': pastStudy,
      'referral': referral,
      'quran_juz': quranJuz,
      'telegram': telegram,
      'issuspended': issuspended,
      'isAdmin': isAdmin,
      'isTeacher': isTeacher,
      'isSuper': isSuper,
      'mentor': mentor,
      'isCompleted': isCompleted,
      'isReal': isReal,
      'isChecked': isChecked,
      'mentoor': mentoor,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.born == e2?.born &&
        e1?.address == e2?.address &&
        e1?.gender == e2?.gender &&
        e1?.fullname == e2?.fullname &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.schoolLevel == e2?.schoolLevel &&
        e1?.job == e2?.job &&
        e1?.socialStatus == e2?.socialStatus &&
        e1?.pastStudy == e2?.pastStudy &&
        e1?.referral == e2?.referral &&
        e1?.quranJuz == e2?.quranJuz &&
        e1?.telegram == e2?.telegram &&
        e1?.issuspended == e2?.issuspended &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isTeacher == e2?.isTeacher &&
        e1?.isSuper == e2?.isSuper &&
        e1?.mentor == e2?.mentor &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.isReal == e2?.isReal &&
        e1?.isChecked == e2?.isChecked &&
        e1?.mentoor == e2?.mentoor &&
        listEquality.equals(e1?.mentoorr, e2?.mentoorr) &&
        listEquality.equals(e1?.searchTags, e2?.searchTags) &&
        listEquality.equals(e1?.cohorts, e2?.cohorts);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.born,
        e?.address,
        e?.gender,
        e?.fullname,
        e?.state,
        e?.city,
        e?.schoolLevel,
        e?.job,
        e?.socialStatus,
        e?.pastStudy,
        e?.referral,
        e?.quranJuz,
        e?.telegram,
        e?.issuspended,
        e?.isAdmin,
        e?.isTeacher,
        e?.isSuper,
        e?.mentor,
        e?.isCompleted,
        e?.isReal,
        e?.isChecked,
        e?.mentoor,
        e?.mentoorr,
        e?.searchTags,
        e?.cohorts
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

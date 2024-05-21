import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "video_presentation" field.
  String? _videoPresentation;
  String get videoPresentation => _videoPresentation ?? '';
  bool hasVideoPresentation() => _videoPresentation != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "rejected" field.
  List<String>? _rejected;
  List<String> get rejected => _rejected ?? const [];
  bool hasRejected() => _rejected != null;

  // "liked" field.
  List<String>? _liked;
  List<String> get liked => _liked ?? const [];
  bool hasLiked() => _liked != null;

  // "isusbscribed" field.
  bool? _isusbscribed;
  bool get isusbscribed => _isusbscribed ?? false;
  bool hasIsusbscribed() => _isusbscribed != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "startupstage" field.
  String? _startupstage;
  String get startupstage => _startupstage ?? '';
  bool hasStartupstage() => _startupstage != null;

  // "revenuestartup" field.
  int? _revenuestartup;
  int get revenuestartup => _revenuestartup ?? 0;
  bool hasRevenuestartup() => _revenuestartup != null;

  // "fundingstartup" field.
  int? _fundingstartup;
  int get fundingstartup => _fundingstartup ?? 0;
  bool hasFundingstartup() => _fundingstartup != null;

  // "requestlist" field.
  List<String>? _requestlist;
  List<String> get requestlist => _requestlist ?? const [];
  bool hasRequestlist() => _requestlist != null;

  // "tourstep" field.
  int? _tourstep;
  int get tourstep => _tourstep ?? 0;
  bool hasTourstep() => _tourstep != null;

  // "likedidea" field.
  List<DocumentReference>? _likedidea;
  List<DocumentReference> get likedidea => _likedidea ?? const [];
  bool hasLikedidea() => _likedidea != null;

  // "rejectedidea" field.
  List<DocumentReference>? _rejectedidea;
  List<DocumentReference> get rejectedidea => _rejectedidea ?? const [];
  bool hasRejectedidea() => _rejectedidea != null;

  // "noofswipes" field.
  int? _noofswipes;
  int get noofswipes => _noofswipes ?? 0;
  bool hasNoofswipes() => _noofswipes != null;

  // "selectedmode" field.
  String? _selectedmode;
  String get selectedmode => _selectedmode ?? '';
  bool hasSelectedmode() => _selectedmode != null;

  // "followingidea" field.
  List<DocumentReference>? _followingidea;
  List<DocumentReference> get followingidea => _followingidea ?? const [];
  bool hasFollowingidea() => _followingidea != null;

  // "nearme" field.
  bool? _nearme;
  bool get nearme => _nearme ?? false;
  bool hasNearme() => _nearme != null;

  // "teamedupidea" field.
  List<DocumentReference>? _teamedupidea;
  List<DocumentReference> get teamedupidea => _teamedupidea ?? const [];
  bool hasTeamedupidea() => _teamedupidea != null;

  // "iseliteuser" field.
  bool? _iseliteuser;
  bool get iseliteuser => _iseliteuser ?? false;
  bool hasIseliteuser() => _iseliteuser != null;

  // "profilestep" field.
  double? _profilestep;
  double get profilestep => _profilestep ?? 0.0;
  bool hasProfilestep() => _profilestep != null;

  // "islinkedIndone" field.
  bool? _islinkedIndone;
  bool get islinkedIndone => _islinkedIndone ?? false;
  bool hasIslinkedIndone() => _islinkedIndone != null;

  // "lastswipeduserref" field.
  DocumentReference? _lastswipeduserref;
  DocumentReference? get lastswipeduserref => _lastswipeduserref;
  bool hasLastswipeduserref() => _lastswipeduserref != null;

  // "lastswipeduseruid" field.
  String? _lastswipeduseruid;
  String get lastswipeduseruid => _lastswipeduseruid ?? '';
  bool hasLastswipeduseruid() => _lastswipeduseruid != null;

  // "teamsizestartupstring" field.
  String? _teamsizestartupstring;
  String get teamsizestartupstring => _teamsizestartupstring ?? '';
  bool hasTeamsizestartupstring() => _teamsizestartupstring != null;

  // "likedstartup" field.
  List<DocumentReference>? _likedstartup;
  List<DocumentReference> get likedstartup => _likedstartup ?? const [];
  bool hasLikedstartup() => _likedstartup != null;

  // "rejectedstartup" field.
  List<DocumentReference>? _rejectedstartup;
  List<DocumentReference> get rejectedstartup => _rejectedstartup ?? const [];
  bool hasRejectedstartup() => _rejectedstartup != null;

  // "lookingfor" field.
  String? _lookingfor;
  String get lookingfor => _lookingfor ?? '';
  bool hasLookingfor() => _lookingfor != null;

  // "contactlist" field.
  List<DocumentReference>? _contactlist;
  List<DocumentReference> get contactlist => _contactlist ?? const [];
  bool hasContactlist() => _contactlist != null;

  // "lastswipedidearef" field.
  DocumentReference? _lastswipedidearef;
  DocumentReference? get lastswipedidearef => _lastswipedidearef;
  bool hasLastswipedidearef() => _lastswipedidearef != null;

  // "teamedupstartup" field.
  List<DocumentReference>? _teamedupstartup;
  List<DocumentReference> get teamedupstartup => _teamedupstartup ?? const [];
  bool hasTeamedupstartup() => _teamedupstartup != null;

  // "startupindustrytypefilter" field.
  String? _startupindustrytypefilter;
  String get startupindustrytypefilter => _startupindustrytypefilter ?? '';
  bool hasStartupindustrytypefilter() => _startupindustrytypefilter != null;

  // "startuplookingforfilter" field.
  String? _startuplookingforfilter;
  String get startuplookingforfilter => _startuplookingforfilter ?? '';
  bool hasStartuplookingforfilter() => _startuplookingforfilter != null;

  // "rolefilter" field.
  String? _rolefilter;
  String get rolefilter => _rolefilter ?? '';
  bool hasRolefilter() => _rolefilter != null;

  // "lookingforfilter" field.
  String? _lookingforfilter;
  String get lookingforfilter => _lookingforfilter ?? '';
  bool hasLookingforfilter() => _lookingforfilter != null;

  // "reviewed" field.
  bool? _reviewed;
  bool get reviewed => _reviewed ?? false;
  bool hasReviewed() => _reviewed != null;

  // "notshowlinkedinreminder" field.
  bool? _notshowlinkedinreminder;
  bool get notshowlinkedinreminder => _notshowlinkedinreminder ?? false;
  bool hasNotshowlinkedinreminder() => _notshowlinkedinreminder != null;

  // "ideapopupshown" field.
  bool? _ideapopupshown;
  bool get ideapopupshown => _ideapopupshown ?? false;
  bool hasIdeapopupshown() => _ideapopupshown != null;

  // "startupexist" field.
  bool? _startupexist;
  bool get startupexist => _startupexist ?? false;
  bool hasStartupexist() => _startupexist != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _videoPresentation = snapshotData['video_presentation'] as String?;
    _description = snapshotData['description'] as String?;
    _role = snapshotData['role'] as String?;
    _skills = getDataList(snapshotData['skills']);
    _rejected = getDataList(snapshotData['rejected']);
    _liked = getDataList(snapshotData['liked']);
    _isusbscribed = snapshotData['isusbscribed'] as bool?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
    _startupstage = snapshotData['startupstage'] as String?;
    _revenuestartup = castToType<int>(snapshotData['revenuestartup']);
    _fundingstartup = castToType<int>(snapshotData['fundingstartup']);
    _requestlist = getDataList(snapshotData['requestlist']);
    _tourstep = castToType<int>(snapshotData['tourstep']);
    _likedidea = getDataList(snapshotData['likedidea']);
    _rejectedidea = getDataList(snapshotData['rejectedidea']);
    _noofswipes = castToType<int>(snapshotData['noofswipes']);
    _selectedmode = snapshotData['selectedmode'] as String?;
    _followingidea = getDataList(snapshotData['followingidea']);
    _nearme = snapshotData['nearme'] as bool?;
    _teamedupidea = getDataList(snapshotData['teamedupidea']);
    _iseliteuser = snapshotData['iseliteuser'] as bool?;
    _profilestep = castToType<double>(snapshotData['profilestep']);
    _islinkedIndone = snapshotData['islinkedIndone'] as bool?;
    _lastswipeduserref =
        snapshotData['lastswipeduserref'] as DocumentReference?;
    _lastswipeduseruid = snapshotData['lastswipeduseruid'] as String?;
    _teamsizestartupstring = snapshotData['teamsizestartupstring'] as String?;
    _likedstartup = getDataList(snapshotData['likedstartup']);
    _rejectedstartup = getDataList(snapshotData['rejectedstartup']);
    _lookingfor = snapshotData['lookingfor'] as String?;
    _contactlist = getDataList(snapshotData['contactlist']);
    _lastswipedidearef =
        snapshotData['lastswipedidearef'] as DocumentReference?;
    _teamedupstartup = getDataList(snapshotData['teamedupstartup']);
    _startupindustrytypefilter =
        snapshotData['startupindustrytypefilter'] as String?;
    _startuplookingforfilter =
        snapshotData['startuplookingforfilter'] as String?;
    _rolefilter = snapshotData['rolefilter'] as String?;
    _lookingforfilter = snapshotData['lookingforfilter'] as String?;
    _reviewed = snapshotData['reviewed'] as bool?;
    _notshowlinkedinreminder = snapshotData['notshowlinkedinreminder'] as bool?;
    _ideapopupshown = snapshotData['ideapopupshown'] as bool?;
    _startupexist = snapshotData['startupexist'] as bool?;
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
  String? videoPresentation,
  String? description,
  String? role,
  bool? isusbscribed,
  String? city,
  String? state,
  String? country,
  String? startupstage,
  int? revenuestartup,
  int? fundingstartup,
  int? tourstep,
  int? noofswipes,
  String? selectedmode,
  bool? nearme,
  bool? iseliteuser,
  double? profilestep,
  bool? islinkedIndone,
  DocumentReference? lastswipeduserref,
  String? lastswipeduseruid,
  String? teamsizestartupstring,
  String? lookingfor,
  DocumentReference? lastswipedidearef,
  String? startupindustrytypefilter,
  String? startuplookingforfilter,
  String? rolefilter,
  String? lookingforfilter,
  bool? reviewed,
  bool? notshowlinkedinreminder,
  bool? ideapopupshown,
  bool? startupexist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'video_presentation': videoPresentation,
      'description': description,
      'role': role,
      'isusbscribed': isusbscribed,
      'city': city,
      'state': state,
      'country': country,
      'startupstage': startupstage,
      'revenuestartup': revenuestartup,
      'fundingstartup': fundingstartup,
      'tourstep': tourstep,
      'noofswipes': noofswipes,
      'selectedmode': selectedmode,
      'nearme': nearme,
      'iseliteuser': iseliteuser,
      'profilestep': profilestep,
      'islinkedIndone': islinkedIndone,
      'lastswipeduserref': lastswipeduserref,
      'lastswipeduseruid': lastswipeduseruid,
      'teamsizestartupstring': teamsizestartupstring,
      'lookingfor': lookingfor,
      'lastswipedidearef': lastswipedidearef,
      'startupindustrytypefilter': startupindustrytypefilter,
      'startuplookingforfilter': startuplookingforfilter,
      'rolefilter': rolefilter,
      'lookingforfilter': lookingforfilter,
      'reviewed': reviewed,
      'notshowlinkedinreminder': notshowlinkedinreminder,
      'ideapopupshown': ideapopupshown,
      'startupexist': startupexist,
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
        e1?.videoPresentation == e2?.videoPresentation &&
        e1?.description == e2?.description &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.skills, e2?.skills) &&
        listEquality.equals(e1?.rejected, e2?.rejected) &&
        listEquality.equals(e1?.liked, e2?.liked) &&
        e1?.isusbscribed == e2?.isusbscribed &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country &&
        e1?.startupstage == e2?.startupstage &&
        e1?.revenuestartup == e2?.revenuestartup &&
        e1?.fundingstartup == e2?.fundingstartup &&
        listEquality.equals(e1?.requestlist, e2?.requestlist) &&
        e1?.tourstep == e2?.tourstep &&
        listEquality.equals(e1?.likedidea, e2?.likedidea) &&
        listEquality.equals(e1?.rejectedidea, e2?.rejectedidea) &&
        e1?.noofswipes == e2?.noofswipes &&
        e1?.selectedmode == e2?.selectedmode &&
        listEquality.equals(e1?.followingidea, e2?.followingidea) &&
        e1?.nearme == e2?.nearme &&
        listEquality.equals(e1?.teamedupidea, e2?.teamedupidea) &&
        e1?.iseliteuser == e2?.iseliteuser &&
        e1?.profilestep == e2?.profilestep &&
        e1?.islinkedIndone == e2?.islinkedIndone &&
        e1?.lastswipeduserref == e2?.lastswipeduserref &&
        e1?.lastswipeduseruid == e2?.lastswipeduseruid &&
        e1?.teamsizestartupstring == e2?.teamsizestartupstring &&
        listEquality.equals(e1?.likedstartup, e2?.likedstartup) &&
        listEquality.equals(e1?.rejectedstartup, e2?.rejectedstartup) &&
        e1?.lookingfor == e2?.lookingfor &&
        listEquality.equals(e1?.contactlist, e2?.contactlist) &&
        e1?.lastswipedidearef == e2?.lastswipedidearef &&
        listEquality.equals(e1?.teamedupstartup, e2?.teamedupstartup) &&
        e1?.startupindustrytypefilter == e2?.startupindustrytypefilter &&
        e1?.startuplookingforfilter == e2?.startuplookingforfilter &&
        e1?.rolefilter == e2?.rolefilter &&
        e1?.lookingforfilter == e2?.lookingforfilter &&
        e1?.reviewed == e2?.reviewed &&
        e1?.notshowlinkedinreminder == e2?.notshowlinkedinreminder &&
        e1?.ideapopupshown == e2?.ideapopupshown &&
        e1?.startupexist == e2?.startupexist;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.videoPresentation,
        e?.description,
        e?.role,
        e?.skills,
        e?.rejected,
        e?.liked,
        e?.isusbscribed,
        e?.city,
        e?.state,
        e?.country,
        e?.startupstage,
        e?.revenuestartup,
        e?.fundingstartup,
        e?.requestlist,
        e?.tourstep,
        e?.likedidea,
        e?.rejectedidea,
        e?.noofswipes,
        e?.selectedmode,
        e?.followingidea,
        e?.nearme,
        e?.teamedupidea,
        e?.iseliteuser,
        e?.profilestep,
        e?.islinkedIndone,
        e?.lastswipeduserref,
        e?.lastswipeduseruid,
        e?.teamsizestartupstring,
        e?.likedstartup,
        e?.rejectedstartup,
        e?.lookingfor,
        e?.contactlist,
        e?.lastswipedidearef,
        e?.teamedupstartup,
        e?.startupindustrytypefilter,
        e?.startuplookingforfilter,
        e?.rolefilter,
        e?.lookingforfilter,
        e?.reviewed,
        e?.notshowlinkedinreminder,
        e?.ideapopupshown,
        e?.startupexist
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

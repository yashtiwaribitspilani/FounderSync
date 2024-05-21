import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StartupRecord extends FirestoreRecord {
  StartupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "foundedon" field.
  DateTime? _foundedon;
  DateTime? get foundedon => _foundedon;
  bool hasFoundedon() => _foundedon != null;

  // "userstartup" field.
  DocumentReference? _userstartup;
  DocumentReference? get userstartup => _userstartup;
  bool hasUserstartup() => _userstartup != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "users" field.
  int? _users;
  int get users => _users ?? 0;
  bool hasUsers() => _users != null;

  // "monthlyrevenue" field.
  int? _monthlyrevenue;
  int get monthlyrevenue => _monthlyrevenue ?? 0;
  bool hasMonthlyrevenue() => _monthlyrevenue != null;

  // "prototypelink" field.
  String? _prototypelink;
  String get prototypelink => _prototypelink ?? '';
  bool hasPrototypelink() => _prototypelink != null;

  // "customers" field.
  int? _customers;
  int get customers => _customers ?? 0;
  bool hasCustomers() => _customers != null;

  // "noofuser" field.
  int? _noofuser;
  int get noofuser => _noofuser ?? 0;
  bool hasNoofuser() => _noofuser != null;

  // "teamsize" field.
  String? _teamsize;
  String get teamsize => _teamsize ?? '';
  bool hasTeamsize() => _teamsize != null;

  // "lookingfor" field.
  List<String>? _lookingfor;
  List<String> get lookingfor => _lookingfor ?? const [];
  bool hasLookingfor() => _lookingfor != null;

  // "updated" field.
  bool? _updated;
  bool get updated => _updated ?? false;
  bool hasUpdated() => _updated != null;

  // "industrytyoe" field.
  String? _industrytyoe;
  String get industrytyoe => _industrytyoe ?? '';
  bool hasIndustrytyoe() => _industrytyoe != null;

  // "teamedup" field.
  List<DocumentReference>? _teamedup;
  List<DocumentReference> get teamedup => _teamedup ?? const [];
  bool hasTeamedup() => _teamedup != null;

  // "requestedlist" field.
  List<DocumentReference>? _requestedlist;
  List<DocumentReference> get requestedlist => _requestedlist ?? const [];
  bool hasRequestedlist() => _requestedlist != null;

  // "rejectedlist" field.
  List<DocumentReference>? _rejectedlist;
  List<DocumentReference> get rejectedlist => _rejectedlist ?? const [];
  bool hasRejectedlist() => _rejectedlist != null;

  // "subscriberliststartup" field.
  List<DocumentReference>? _subscriberliststartup;
  List<DocumentReference> get subscriberliststartup =>
      _subscriberliststartup ?? const [];
  bool hasSubscriberliststartup() => _subscriberliststartup != null;

  // "reviewed" field.
  bool? _reviewed;
  bool get reviewed => _reviewed ?? false;
  bool hasReviewed() => _reviewed != null;

  // "datecreated" field.
  DateTime? _datecreated;
  DateTime? get datecreated => _datecreated;
  bool hasDatecreated() => _datecreated != null;

  void _initializeFields() {
    _logo = snapshotData['logo'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _foundedon = snapshotData['foundedon'] as DateTime?;
    _userstartup = snapshotData['userstartup'] as DocumentReference?;
    _stage = snapshotData['stage'] as String?;
    _users = castToType<int>(snapshotData['users']);
    _monthlyrevenue = castToType<int>(snapshotData['monthlyrevenue']);
    _prototypelink = snapshotData['prototypelink'] as String?;
    _customers = castToType<int>(snapshotData['customers']);
    _noofuser = castToType<int>(snapshotData['noofuser']);
    _teamsize = snapshotData['teamsize'] as String?;
    _lookingfor = getDataList(snapshotData['lookingfor']);
    _updated = snapshotData['updated'] as bool?;
    _industrytyoe = snapshotData['industrytyoe'] as String?;
    _teamedup = getDataList(snapshotData['teamedup']);
    _requestedlist = getDataList(snapshotData['requestedlist']);
    _rejectedlist = getDataList(snapshotData['rejectedlist']);
    _subscriberliststartup = getDataList(snapshotData['subscriberliststartup']);
    _reviewed = snapshotData['reviewed'] as bool?;
    _datecreated = snapshotData['datecreated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startup');

  static Stream<StartupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StartupRecord.fromSnapshot(s));

  static Future<StartupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StartupRecord.fromSnapshot(s));

  static StartupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StartupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StartupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StartupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StartupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StartupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStartupRecordData({
  String? logo,
  String? name,
  String? description,
  DateTime? foundedon,
  DocumentReference? userstartup,
  String? stage,
  int? users,
  int? monthlyrevenue,
  String? prototypelink,
  int? customers,
  int? noofuser,
  String? teamsize,
  bool? updated,
  String? industrytyoe,
  bool? reviewed,
  DateTime? datecreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logo': logo,
      'name': name,
      'description': description,
      'foundedon': foundedon,
      'userstartup': userstartup,
      'stage': stage,
      'users': users,
      'monthlyrevenue': monthlyrevenue,
      'prototypelink': prototypelink,
      'customers': customers,
      'noofuser': noofuser,
      'teamsize': teamsize,
      'updated': updated,
      'industrytyoe': industrytyoe,
      'reviewed': reviewed,
      'datecreated': datecreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class StartupRecordDocumentEquality implements Equality<StartupRecord> {
  const StartupRecordDocumentEquality();

  @override
  bool equals(StartupRecord? e1, StartupRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logo == e2?.logo &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.foundedon == e2?.foundedon &&
        e1?.userstartup == e2?.userstartup &&
        e1?.stage == e2?.stage &&
        e1?.users == e2?.users &&
        e1?.monthlyrevenue == e2?.monthlyrevenue &&
        e1?.prototypelink == e2?.prototypelink &&
        e1?.customers == e2?.customers &&
        e1?.noofuser == e2?.noofuser &&
        e1?.teamsize == e2?.teamsize &&
        listEquality.equals(e1?.lookingfor, e2?.lookingfor) &&
        e1?.updated == e2?.updated &&
        e1?.industrytyoe == e2?.industrytyoe &&
        listEquality.equals(e1?.teamedup, e2?.teamedup) &&
        listEquality.equals(e1?.requestedlist, e2?.requestedlist) &&
        listEquality.equals(e1?.rejectedlist, e2?.rejectedlist) &&
        listEquality.equals(
            e1?.subscriberliststartup, e2?.subscriberliststartup) &&
        e1?.reviewed == e2?.reviewed &&
        e1?.datecreated == e2?.datecreated;
  }

  @override
  int hash(StartupRecord? e) => const ListEquality().hash([
        e?.logo,
        e?.name,
        e?.description,
        e?.foundedon,
        e?.userstartup,
        e?.stage,
        e?.users,
        e?.monthlyrevenue,
        e?.prototypelink,
        e?.customers,
        e?.noofuser,
        e?.teamsize,
        e?.lookingfor,
        e?.updated,
        e?.industrytyoe,
        e?.teamedup,
        e?.requestedlist,
        e?.rejectedlist,
        e?.subscriberliststartup,
        e?.reviewed,
        e?.datecreated
      ]);

  @override
  bool isValidKey(Object? o) => o is StartupRecord;
}

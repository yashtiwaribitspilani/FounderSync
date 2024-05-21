import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdeaRecord extends FirestoreRecord {
  IdeaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "problem" field.
  String? _problem;
  String get problem => _problem ?? '';
  bool hasProblem() => _problem != null;

  // "solution" field.
  String? _solution;
  String get solution => _solution ?? '';
  bool hasSolution() => _solution != null;

  // "currentcompetition" field.
  List<String>? _currentcompetition;
  List<String> get currentcompetition => _currentcompetition ?? const [];
  bool hasCurrentcompetition() => _currentcompetition != null;

  // "solutionrating" field.
  String? _solutionrating;
  String get solutionrating => _solutionrating ?? '';
  bool hasSolutionrating() => _solutionrating != null;

  // "costofmaking" field.
  int? _costofmaking;
  int get costofmaking => _costofmaking ?? 0;
  bool hasCostofmaking() => _costofmaking != null;

  // "costofdelivery" field.
  int? _costofdelivery;
  int get costofdelivery => _costofdelivery ?? 0;
  bool hasCostofdelivery() => _costofdelivery != null;

  // "saleprice" field.
  int? _saleprice;
  int get saleprice => _saleprice ?? 0;
  bool hasSaleprice() => _saleprice != null;

  // "profitunit" field.
  int? _profitunit;
  int get profitunit => _profitunit ?? 0;
  bool hasProfitunit() => _profitunit != null;

  // "requests" field.
  List<String>? _requests;
  List<String> get requests => _requests ?? const [];
  bool hasRequests() => _requests != null;

  // "teamups" field.
  List<String>? _teamups;
  List<String> get teamups => _teamups ?? const [];
  bool hasTeamups() => _teamups != null;

  // "rejected" field.
  List<String>? _rejected;
  List<String> get rejected => _rejected ?? const [];
  bool hasRejected() => _rejected != null;

  // "subscriberlist" field.
  List<DocumentReference>? _subscriberlist;
  List<DocumentReference> get subscriberlist => _subscriberlist ?? const [];
  bool hasSubscriberlist() => _subscriberlist != null;

  // "sumrating" field.
  double? _sumrating;
  double get sumrating => _sumrating ?? 0.0;
  bool hasSumrating() => _sumrating != null;

  // "noofratings" field.
  double? _noofratings;
  double get noofratings => _noofratings ?? 0.0;
  bool hasNoofratings() => _noofratings != null;

  // "usersliked" field.
  List<DocumentReference>? _usersliked;
  List<DocumentReference> get usersliked => _usersliked ?? const [];
  bool hasUsersliked() => _usersliked != null;

  // "usersdisliked" field.
  List<DocumentReference>? _usersdisliked;
  List<DocumentReference> get usersdisliked => _usersdisliked ?? const [];
  bool hasUsersdisliked() => _usersdisliked != null;

  // "ratingavg" field.
  double? _ratingavg;
  double get ratingavg => _ratingavg ?? 0.0;
  bool hasRatingavg() => _ratingavg != null;

  // "commentcount" field.
  int? _commentcount;
  int get commentcount => _commentcount ?? 0;
  bool hasCommentcount() => _commentcount != null;

  // "newupdates" field.
  bool? _newupdates;
  bool get newupdates => _newupdates ?? false;
  bool hasNewupdates() => _newupdates != null;

  // "industrytype" field.
  String? _industrytype;
  String get industrytype => _industrytype ?? '';
  bool hasIndustrytype() => _industrytype != null;

  // "datecreated" field.
  DateTime? _datecreated;
  DateTime? get datecreated => _datecreated;
  bool hasDatecreated() => _datecreated != null;

  // "referencemannual" field.
  DocumentReference? _referencemannual;
  DocumentReference? get referencemannual => _referencemannual;
  bool hasReferencemannual() => _referencemannual != null;

  // "reviewed" field.
  bool? _reviewed;
  bool get reviewed => _reviewed ?? false;
  bool hasReviewed() => _reviewed != null;

  // "uploadedpdf" field.
  String? _uploadedpdf;
  String get uploadedpdf => _uploadedpdf ?? '';
  bool hasUploadedpdf() => _uploadedpdf != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _logo = snapshotData['logo'] as String?;
    _name = snapshotData['name'] as String?;
    _problem = snapshotData['problem'] as String?;
    _solution = snapshotData['solution'] as String?;
    _currentcompetition = getDataList(snapshotData['currentcompetition']);
    _solutionrating = snapshotData['solutionrating'] as String?;
    _costofmaking = castToType<int>(snapshotData['costofmaking']);
    _costofdelivery = castToType<int>(snapshotData['costofdelivery']);
    _saleprice = castToType<int>(snapshotData['saleprice']);
    _profitunit = castToType<int>(snapshotData['profitunit']);
    _requests = getDataList(snapshotData['requests']);
    _teamups = getDataList(snapshotData['teamups']);
    _rejected = getDataList(snapshotData['rejected']);
    _subscriberlist = getDataList(snapshotData['subscriberlist']);
    _sumrating = castToType<double>(snapshotData['sumrating']);
    _noofratings = castToType<double>(snapshotData['noofratings']);
    _usersliked = getDataList(snapshotData['usersliked']);
    _usersdisliked = getDataList(snapshotData['usersdisliked']);
    _ratingavg = castToType<double>(snapshotData['ratingavg']);
    _commentcount = castToType<int>(snapshotData['commentcount']);
    _newupdates = snapshotData['newupdates'] as bool?;
    _industrytype = snapshotData['industrytype'] as String?;
    _datecreated = snapshotData['datecreated'] as DateTime?;
    _referencemannual = snapshotData['referencemannual'] as DocumentReference?;
    _reviewed = snapshotData['reviewed'] as bool?;
    _uploadedpdf = snapshotData['uploadedpdf'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('idea');

  static Stream<IdeaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdeaRecord.fromSnapshot(s));

  static Future<IdeaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdeaRecord.fromSnapshot(s));

  static IdeaRecord fromSnapshot(DocumentSnapshot snapshot) => IdeaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdeaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdeaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdeaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdeaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdeaRecordData({
  DocumentReference? user,
  String? logo,
  String? name,
  String? problem,
  String? solution,
  String? solutionrating,
  int? costofmaking,
  int? costofdelivery,
  int? saleprice,
  int? profitunit,
  double? sumrating,
  double? noofratings,
  double? ratingavg,
  int? commentcount,
  bool? newupdates,
  String? industrytype,
  DateTime? datecreated,
  DocumentReference? referencemannual,
  bool? reviewed,
  String? uploadedpdf,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'logo': logo,
      'name': name,
      'problem': problem,
      'solution': solution,
      'solutionrating': solutionrating,
      'costofmaking': costofmaking,
      'costofdelivery': costofdelivery,
      'saleprice': saleprice,
      'profitunit': profitunit,
      'sumrating': sumrating,
      'noofratings': noofratings,
      'ratingavg': ratingavg,
      'commentcount': commentcount,
      'newupdates': newupdates,
      'industrytype': industrytype,
      'datecreated': datecreated,
      'referencemannual': referencemannual,
      'reviewed': reviewed,
      'uploadedpdf': uploadedpdf,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdeaRecordDocumentEquality implements Equality<IdeaRecord> {
  const IdeaRecordDocumentEquality();

  @override
  bool equals(IdeaRecord? e1, IdeaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.logo == e2?.logo &&
        e1?.name == e2?.name &&
        e1?.problem == e2?.problem &&
        e1?.solution == e2?.solution &&
        listEquality.equals(e1?.currentcompetition, e2?.currentcompetition) &&
        e1?.solutionrating == e2?.solutionrating &&
        e1?.costofmaking == e2?.costofmaking &&
        e1?.costofdelivery == e2?.costofdelivery &&
        e1?.saleprice == e2?.saleprice &&
        e1?.profitunit == e2?.profitunit &&
        listEquality.equals(e1?.requests, e2?.requests) &&
        listEquality.equals(e1?.teamups, e2?.teamups) &&
        listEquality.equals(e1?.rejected, e2?.rejected) &&
        listEquality.equals(e1?.subscriberlist, e2?.subscriberlist) &&
        e1?.sumrating == e2?.sumrating &&
        e1?.noofratings == e2?.noofratings &&
        listEquality.equals(e1?.usersliked, e2?.usersliked) &&
        listEquality.equals(e1?.usersdisliked, e2?.usersdisliked) &&
        e1?.ratingavg == e2?.ratingavg &&
        e1?.commentcount == e2?.commentcount &&
        e1?.newupdates == e2?.newupdates &&
        e1?.industrytype == e2?.industrytype &&
        e1?.datecreated == e2?.datecreated &&
        e1?.referencemannual == e2?.referencemannual &&
        e1?.reviewed == e2?.reviewed &&
        e1?.uploadedpdf == e2?.uploadedpdf;
  }

  @override
  int hash(IdeaRecord? e) => const ListEquality().hash([
        e?.user,
        e?.logo,
        e?.name,
        e?.problem,
        e?.solution,
        e?.currentcompetition,
        e?.solutionrating,
        e?.costofmaking,
        e?.costofdelivery,
        e?.saleprice,
        e?.profitunit,
        e?.requests,
        e?.teamups,
        e?.rejected,
        e?.subscriberlist,
        e?.sumrating,
        e?.noofratings,
        e?.usersliked,
        e?.usersdisliked,
        e?.ratingavg,
        e?.commentcount,
        e?.newupdates,
        e?.industrytype,
        e?.datecreated,
        e?.referencemannual,
        e?.reviewed,
        e?.uploadedpdf
      ]);

  @override
  bool isValidKey(Object? o) => o is IdeaRecord;
}

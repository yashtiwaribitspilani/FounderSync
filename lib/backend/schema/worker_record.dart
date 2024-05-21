import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WorkerRecord extends FirestoreRecord {
  WorkerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "companyname" field.
  String? _companyname;
  String get companyname => _companyname ?? '';
  bool hasCompanyname() => _companyname != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  // "work" field.
  DocumentReference? _work;
  DocumentReference? get work => _work;
  bool hasWork() => _work != null;

  void _initializeFields() {
    _role = snapshotData['role'] as String?;
    _companyname = snapshotData['companyname'] as String?;
    _description = snapshotData['description'] as String?;
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
    _work = snapshotData['work'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('worker');

  static Stream<WorkerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerRecord.fromSnapshot(s));

  static Future<WorkerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerRecord.fromSnapshot(s));

  static WorkerRecord fromSnapshot(DocumentSnapshot snapshot) => WorkerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerRecordData({
  String? role,
  String? companyname,
  String? description,
  DateTime? startdate,
  DateTime? enddate,
  DocumentReference? work,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'companyname': companyname,
      'description': description,
      'startdate': startdate,
      'enddate': enddate,
      'work': work,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerRecordDocumentEquality implements Equality<WorkerRecord> {
  const WorkerRecordDocumentEquality();

  @override
  bool equals(WorkerRecord? e1, WorkerRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.companyname == e2?.companyname &&
        e1?.description == e2?.description &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate &&
        e1?.work == e2?.work;
  }

  @override
  int hash(WorkerRecord? e) => const ListEquality().hash([
        e?.role,
        e?.companyname,
        e?.description,
        e?.startdate,
        e?.enddate,
        e?.work
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerRecord;
}

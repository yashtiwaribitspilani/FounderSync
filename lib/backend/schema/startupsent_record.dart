import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StartupsentRecord extends FirestoreRecord {
  StartupsentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "startupref" field.
  DocumentReference? _startupref;
  DocumentReference? get startupref => _startupref;
  bool hasStartupref() => _startupref != null;

  // "userwhorequestedteamupstartup" field.
  DocumentReference? _userwhorequestedteamupstartup;
  DocumentReference? get userwhorequestedteamupstartup =>
      _userwhorequestedteamupstartup;
  bool hasUserwhorequestedteamupstartup() =>
      _userwhorequestedteamupstartup != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _startupref = snapshotData['startupref'] as DocumentReference?;
    _userwhorequestedteamupstartup =
        snapshotData['userwhorequestedteamupstartup'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startupsent');

  static Stream<StartupsentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StartupsentRecord.fromSnapshot(s));

  static Future<StartupsentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StartupsentRecord.fromSnapshot(s));

  static StartupsentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StartupsentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StartupsentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StartupsentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StartupsentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StartupsentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStartupsentRecordData({
  DocumentReference? startupref,
  DocumentReference? userwhorequestedteamupstartup,
  String? status,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startupref': startupref,
      'userwhorequestedteamupstartup': userwhorequestedteamupstartup,
      'status': status,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class StartupsentRecordDocumentEquality implements Equality<StartupsentRecord> {
  const StartupsentRecordDocumentEquality();

  @override
  bool equals(StartupsentRecord? e1, StartupsentRecord? e2) {
    return e1?.startupref == e2?.startupref &&
        e1?.userwhorequestedteamupstartup ==
            e2?.userwhorequestedteamupstartup &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time;
  }

  @override
  int hash(StartupsentRecord? e) => const ListEquality().hash(
      [e?.startupref, e?.userwhorequestedteamupstartup, e?.status, e?.time]);

  @override
  bool isValidKey(Object? o) => o is StartupsentRecord;
}

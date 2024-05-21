import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StartupRequestTeamUpRecord extends FirestoreRecord {
  StartupRequestTeamUpRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "startupref" field.
  DocumentReference? _startupref;
  DocumentReference? get startupref => _startupref;
  bool hasStartupref() => _startupref != null;

  // "startupowner" field.
  DocumentReference? _startupowner;
  DocumentReference? get startupowner => _startupowner;
  bool hasStartupowner() => _startupowner != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _startupref = snapshotData['startupref'] as DocumentReference?;
    _startupowner = snapshotData['startupowner'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _role = snapshotData['role'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startupRequestTeamUp');

  static Stream<StartupRequestTeamUpRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => StartupRequestTeamUpRecord.fromSnapshot(s));

  static Future<StartupRequestTeamUpRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StartupRequestTeamUpRecord.fromSnapshot(s));

  static StartupRequestTeamUpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StartupRequestTeamUpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StartupRequestTeamUpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StartupRequestTeamUpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StartupRequestTeamUpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StartupRequestTeamUpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStartupRequestTeamUpRecordData({
  DocumentReference? startupref,
  DocumentReference? startupowner,
  String? message,
  String? role,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startupref': startupref,
      'startupowner': startupowner,
      'message': message,
      'role': role,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class StartupRequestTeamUpRecordDocumentEquality
    implements Equality<StartupRequestTeamUpRecord> {
  const StartupRequestTeamUpRecordDocumentEquality();

  @override
  bool equals(StartupRequestTeamUpRecord? e1, StartupRequestTeamUpRecord? e2) {
    return e1?.startupref == e2?.startupref &&
        e1?.startupowner == e2?.startupowner &&
        e1?.message == e2?.message &&
        e1?.role == e2?.role &&
        e1?.userref == e2?.userref;
  }

  @override
  int hash(StartupRequestTeamUpRecord? e) => const ListEquality()
      .hash([e?.startupref, e?.startupowner, e?.message, e?.role, e?.userref]);

  @override
  bool isValidKey(Object? o) => o is StartupRequestTeamUpRecord;
}

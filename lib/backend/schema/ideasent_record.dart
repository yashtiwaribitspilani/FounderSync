import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class IdeasentRecord extends FirestoreRecord {
  IdeasentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idearef" field.
  DocumentReference? _idearef;
  DocumentReference? get idearef => _idearef;
  bool hasIdearef() => _idearef != null;

  // "userwhorequestedteamup" field.
  DocumentReference? _userwhorequestedteamup;
  DocumentReference? get userwhorequestedteamup => _userwhorequestedteamup;
  bool hasUserwhorequestedteamup() => _userwhorequestedteamup != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _idearef = snapshotData['idearef'] as DocumentReference?;
    _userwhorequestedteamup =
        snapshotData['userwhorequestedteamup'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ideasent');

  static Stream<IdeasentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdeasentRecord.fromSnapshot(s));

  static Future<IdeasentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdeasentRecord.fromSnapshot(s));

  static IdeasentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IdeasentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdeasentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdeasentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdeasentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdeasentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdeasentRecordData({
  DocumentReference? idearef,
  DocumentReference? userwhorequestedteamup,
  String? status,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idearef': idearef,
      'userwhorequestedteamup': userwhorequestedteamup,
      'status': status,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdeasentRecordDocumentEquality implements Equality<IdeasentRecord> {
  const IdeasentRecordDocumentEquality();

  @override
  bool equals(IdeasentRecord? e1, IdeasentRecord? e2) {
    return e1?.idearef == e2?.idearef &&
        e1?.userwhorequestedteamup == e2?.userwhorequestedteamup &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time;
  }

  @override
  int hash(IdeasentRecord? e) => const ListEquality()
      .hash([e?.idearef, e?.userwhorequestedteamup, e?.status, e?.time]);

  @override
  bool isValidKey(Object? o) => o is IdeasentRecord;
}

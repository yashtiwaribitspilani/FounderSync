import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SentrequestRecord extends FirestoreRecord {
  SentrequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userreference" field.
  DocumentReference? _userreference;
  DocumentReference? get userreference => _userreference;
  bool hasUserreference() => _userreference != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userreference = snapshotData['userreference'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sentrequest')
          : FirebaseFirestore.instance.collectionGroup('sentrequest');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sentrequest').doc(id);

  static Stream<SentrequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SentrequestRecord.fromSnapshot(s));

  static Future<SentrequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SentrequestRecord.fromSnapshot(s));

  static SentrequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SentrequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SentrequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SentrequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SentrequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SentrequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSentrequestRecordData({
  DocumentReference? userreference,
  DateTime? time,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userreference': userreference,
      'time': time,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class SentrequestRecordDocumentEquality implements Equality<SentrequestRecord> {
  const SentrequestRecordDocumentEquality();

  @override
  bool equals(SentrequestRecord? e1, SentrequestRecord? e2) {
    return e1?.userreference == e2?.userreference &&
        e1?.time == e2?.time &&
        e1?.status == e2?.status;
  }

  @override
  int hash(SentrequestRecord? e) =>
      const ListEquality().hash([e?.userreference, e?.time, e?.status]);

  @override
  bool isValidKey(Object? o) => o is SentrequestRecord;
}

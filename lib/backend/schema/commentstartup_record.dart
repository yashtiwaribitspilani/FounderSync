import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommentstartupRecord extends FirestoreRecord {
  CommentstartupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "startupref" field.
  DocumentReference? _startupref;
  DocumentReference? get startupref => _startupref;
  bool hasStartupref() => _startupref != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as DocumentReference?;
    _startupref = snapshotData['startupref'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commentstartup');

  static Stream<CommentstartupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentstartupRecord.fromSnapshot(s));

  static Future<CommentstartupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentstartupRecord.fromSnapshot(s));

  static CommentstartupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentstartupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentstartupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentstartupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentstartupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentstartupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentstartupRecordData({
  DocumentReference? userid,
  DocumentReference? startupref,
  String? comment,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'startupref': startupref,
      'comment': comment,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentstartupRecordDocumentEquality
    implements Equality<CommentstartupRecord> {
  const CommentstartupRecordDocumentEquality();

  @override
  bool equals(CommentstartupRecord? e1, CommentstartupRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.startupref == e2?.startupref &&
        e1?.comment == e2?.comment &&
        e1?.time == e2?.time;
  }

  @override
  int hash(CommentstartupRecord? e) => const ListEquality()
      .hash([e?.userid, e?.startupref, e?.comment, e?.time]);

  @override
  bool isValidKey(Object? o) => o is CommentstartupRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TeamupRecord extends FirestoreRecord {
  TeamupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idearef" field.
  DocumentReference? _idearef;
  DocumentReference? get idearef => _idearef;
  bool hasIdearef() => _idearef != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _idearef = snapshotData['idearef'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teamup');

  static Stream<TeamupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamupRecord.fromSnapshot(s));

  static Future<TeamupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamupRecord.fromSnapshot(s));

  static TeamupRecord fromSnapshot(DocumentSnapshot snapshot) => TeamupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamupRecordData({
  DocumentReference? idearef,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idearef': idearef,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamupRecordDocumentEquality implements Equality<TeamupRecord> {
  const TeamupRecordDocumentEquality();

  @override
  bool equals(TeamupRecord? e1, TeamupRecord? e2) {
    return e1?.idearef == e2?.idearef && e1?.userref == e2?.userref;
  }

  @override
  int hash(TeamupRecord? e) =>
      const ListEquality().hash([e?.idearef, e?.userref]);

  @override
  bool isValidKey(Object? o) => o is TeamupRecord;
}

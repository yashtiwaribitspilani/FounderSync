import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeLikeEachOtherRecord extends FirestoreRecord {
  WeLikeEachOtherRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "documentReference" field.
  DocumentReference? _documentReference;
  DocumentReference? get documentReference => _documentReference;
  bool hasDocumentReference() => _documentReference != null;

  // "unseen" field.
  int? _unseen;
  int get unseen => _unseen ?? 0;
  bool hasUnseen() => _unseen != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _documentReference =
        snapshotData['documentReference'] as DocumentReference?;
    _unseen = castToType<int>(snapshotData['unseen']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('weLikeEachOther')
          : FirebaseFirestore.instance.collectionGroup('weLikeEachOther');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('weLikeEachOther').doc(id);

  static Stream<WeLikeEachOtherRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeLikeEachOtherRecord.fromSnapshot(s));

  static Future<WeLikeEachOtherRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeLikeEachOtherRecord.fromSnapshot(s));

  static WeLikeEachOtherRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeLikeEachOtherRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeLikeEachOtherRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeLikeEachOtherRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeLikeEachOtherRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeLikeEachOtherRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeLikeEachOtherRecordData({
  String? uid,
  DocumentReference? documentReference,
  int? unseen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'documentReference': documentReference,
      'unseen': unseen,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeLikeEachOtherRecordDocumentEquality
    implements Equality<WeLikeEachOtherRecord> {
  const WeLikeEachOtherRecordDocumentEquality();

  @override
  bool equals(WeLikeEachOtherRecord? e1, WeLikeEachOtherRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.documentReference == e2?.documentReference &&
        e1?.unseen == e2?.unseen;
  }

  @override
  int hash(WeLikeEachOtherRecord? e) =>
      const ListEquality().hash([e?.uid, e?.documentReference, e?.unseen]);

  @override
  bool isValidKey(Object? o) => o is WeLikeEachOtherRecord;
}

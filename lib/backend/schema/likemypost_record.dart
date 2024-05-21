import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LikemypostRecord extends FirestoreRecord {
  LikemypostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "docref" field.
  DocumentReference? _docref;
  DocumentReference? get docref => _docref;
  bool hasDocref() => _docref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _docref = snapshotData['docref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('likemypost')
          : FirebaseFirestore.instance.collectionGroup('likemypost');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('likemypost').doc(id);

  static Stream<LikemypostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikemypostRecord.fromSnapshot(s));

  static Future<LikemypostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikemypostRecord.fromSnapshot(s));

  static LikemypostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LikemypostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikemypostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikemypostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikemypostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikemypostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikemypostRecordData({
  String? uid,
  DocumentReference? docref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'docref': docref,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikemypostRecordDocumentEquality implements Equality<LikemypostRecord> {
  const LikemypostRecordDocumentEquality();

  @override
  bool equals(LikemypostRecord? e1, LikemypostRecord? e2) {
    return e1?.uid == e2?.uid && e1?.docref == e2?.docref;
  }

  @override
  int hash(LikemypostRecord? e) =>
      const ListEquality().hash([e?.uid, e?.docref]);

  @override
  bool isValidKey(Object? o) => o is LikemypostRecord;
}

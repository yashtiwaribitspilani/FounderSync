import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AcceptedrequestsRecord extends FirestoreRecord {
  AcceptedrequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userreference" field.
  DocumentReference? _userreference;
  DocumentReference? get userreference => _userreference;
  bool hasUserreference() => _userreference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userreference = snapshotData['userreference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('acceptedrequests')
          : FirebaseFirestore.instance.collectionGroup('acceptedrequests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('acceptedrequests').doc(id);

  static Stream<AcceptedrequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcceptedrequestsRecord.fromSnapshot(s));

  static Future<AcceptedrequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AcceptedrequestsRecord.fromSnapshot(s));

  static AcceptedrequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcceptedrequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcceptedrequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcceptedrequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcceptedrequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcceptedrequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcceptedrequestsRecordData({
  DocumentReference? userreference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userreference': userreference,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcceptedrequestsRecordDocumentEquality
    implements Equality<AcceptedrequestsRecord> {
  const AcceptedrequestsRecordDocumentEquality();

  @override
  bool equals(AcceptedrequestsRecord? e1, AcceptedrequestsRecord? e2) {
    return e1?.userreference == e2?.userreference;
  }

  @override
  int hash(AcceptedrequestsRecord? e) =>
      const ListEquality().hash([e?.userreference]);

  @override
  bool isValidKey(Object? o) => o is AcceptedrequestsRecord;
}

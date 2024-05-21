import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserlistRecord extends FirestoreRecord {
  UserlistRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userslist" field.
  List<String>? _userslist;
  List<String> get userslist => _userslist ?? const [];
  bool hasUserslist() => _userslist != null;

  void _initializeFields() {
    _userslist = getDataList(snapshotData['userslist']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userlist');

  static Stream<UserlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserlistRecord.fromSnapshot(s));

  static Future<UserlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserlistRecord.fromSnapshot(s));

  static UserlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserlistRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class UserlistRecordDocumentEquality implements Equality<UserlistRecord> {
  const UserlistRecordDocumentEquality();

  @override
  bool equals(UserlistRecord? e1, UserlistRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userslist, e2?.userslist);
  }

  @override
  int hash(UserlistRecord? e) => const ListEquality().hash([e?.userslist]);

  @override
  bool isValidKey(Object? o) => o is UserlistRecord;
}

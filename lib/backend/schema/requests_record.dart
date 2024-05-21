import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
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

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "ideaowner" field.
  DocumentReference? _ideaowner;
  DocumentReference? get ideaowner => _ideaowner;
  bool hasIdeaowner() => _ideaowner != null;

  void _initializeFields() {
    _idearef = snapshotData['idearef'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _role = snapshotData['role'] as String?;
    _message = snapshotData['message'] as String?;
    _ideaowner = snapshotData['ideaowner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  DocumentReference? idearef,
  DocumentReference? userref,
  String? role,
  String? message,
  DocumentReference? ideaowner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idearef': idearef,
      'userref': userref,
      'role': role,
      'message': message,
      'ideaowner': ideaowner,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.idearef == e2?.idearef &&
        e1?.userref == e2?.userref &&
        e1?.role == e2?.role &&
        e1?.message == e2?.message &&
        e1?.ideaowner == e2?.ideaowner;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality()
      .hash([e?.idearef, e?.userref, e?.role, e?.message, e?.ideaowner]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}

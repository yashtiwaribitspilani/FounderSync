import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class IdeatimelineRecord extends FirestoreRecord {
  IdeatimelineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idearef" field.
  DocumentReference? _idearef;
  DocumentReference? get idearef => _idearef;
  bool hasIdearef() => _idearef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _idearef = snapshotData['idearef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ideatimeline');

  static Stream<IdeatimelineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdeatimelineRecord.fromSnapshot(s));

  static Future<IdeatimelineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdeatimelineRecord.fromSnapshot(s));

  static IdeatimelineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IdeatimelineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdeatimelineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdeatimelineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdeatimelineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdeatimelineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdeatimelineRecordData({
  DocumentReference? idearef,
  String? title,
  String? description,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idearef': idearef,
      'title': title,
      'description': description,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdeatimelineRecordDocumentEquality
    implements Equality<IdeatimelineRecord> {
  const IdeatimelineRecordDocumentEquality();

  @override
  bool equals(IdeatimelineRecord? e1, IdeatimelineRecord? e2) {
    return e1?.idearef == e2?.idearef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date;
  }

  @override
  int hash(IdeatimelineRecord? e) => const ListEquality()
      .hash([e?.idearef, e?.title, e?.description, e?.date]);

  @override
  bool isValidKey(Object? o) => o is IdeatimelineRecord;
}

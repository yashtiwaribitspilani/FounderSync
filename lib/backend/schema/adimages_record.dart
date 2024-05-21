import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AdimagesRecord extends FirestoreRecord {
  AdimagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imageone" field.
  String? _imageone;
  String get imageone => _imageone ?? '';
  bool hasImageone() => _imageone != null;

  // "imagetwo" field.
  String? _imagetwo;
  String get imagetwo => _imagetwo ?? '';
  bool hasImagetwo() => _imagetwo != null;

  // "imagethree" field.
  String? _imagethree;
  String get imagethree => _imagethree ?? '';
  bool hasImagethree() => _imagethree != null;

  void _initializeFields() {
    _imageone = snapshotData['imageone'] as String?;
    _imagetwo = snapshotData['imagetwo'] as String?;
    _imagethree = snapshotData['imagethree'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adimages');

  static Stream<AdimagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdimagesRecord.fromSnapshot(s));

  static Future<AdimagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdimagesRecord.fromSnapshot(s));

  static AdimagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdimagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdimagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdimagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdimagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdimagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdimagesRecordData({
  String? imageone,
  String? imagetwo,
  String? imagethree,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imageone': imageone,
      'imagetwo': imagetwo,
      'imagethree': imagethree,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdimagesRecordDocumentEquality implements Equality<AdimagesRecord> {
  const AdimagesRecordDocumentEquality();

  @override
  bool equals(AdimagesRecord? e1, AdimagesRecord? e2) {
    return e1?.imageone == e2?.imageone &&
        e1?.imagetwo == e2?.imagetwo &&
        e1?.imagethree == e2?.imagethree;
  }

  @override
  int hash(AdimagesRecord? e) =>
      const ListEquality().hash([e?.imageone, e?.imagetwo, e?.imagethree]);

  @override
  bool isValidKey(Object? o) => o is AdimagesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EducationRecord extends FirestoreRecord {
  EducationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "degree" field.
  String? _degree;
  String get degree => _degree ?? '';
  bool hasDegree() => _degree != null;

  // "collegename" field.
  String? _collegename;
  String get collegename => _collegename ?? '';
  bool hasCollegename() => _collegename != null;

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "startyear" field.
  String? _startyear;
  String get startyear => _startyear ?? '';
  bool hasStartyear() => _startyear != null;

  // "endyear" field.
  String? _endyear;
  String get endyear => _endyear ?? '';
  bool hasEndyear() => _endyear != null;

  // "usereducation" field.
  DocumentReference? _usereducation;
  DocumentReference? get usereducation => _usereducation;
  bool hasUsereducation() => _usereducation != null;

  void _initializeFields() {
    _degree = snapshotData['degree'] as String?;
    _collegename = snapshotData['collegename'] as String?;
    _branch = snapshotData['branch'] as String?;
    _startyear = snapshotData['startyear'] as String?;
    _endyear = snapshotData['endyear'] as String?;
    _usereducation = snapshotData['usereducation'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('education');

  static Stream<EducationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EducationRecord.fromSnapshot(s));

  static Future<EducationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EducationRecord.fromSnapshot(s));

  static EducationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EducationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EducationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EducationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EducationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EducationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEducationRecordData({
  String? degree,
  String? collegename,
  String? branch,
  String? startyear,
  String? endyear,
  DocumentReference? usereducation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'degree': degree,
      'collegename': collegename,
      'branch': branch,
      'startyear': startyear,
      'endyear': endyear,
      'usereducation': usereducation,
    }.withoutNulls,
  );

  return firestoreData;
}

class EducationRecordDocumentEquality implements Equality<EducationRecord> {
  const EducationRecordDocumentEquality();

  @override
  bool equals(EducationRecord? e1, EducationRecord? e2) {
    return e1?.degree == e2?.degree &&
        e1?.collegename == e2?.collegename &&
        e1?.branch == e2?.branch &&
        e1?.startyear == e2?.startyear &&
        e1?.endyear == e2?.endyear &&
        e1?.usereducation == e2?.usereducation;
  }

  @override
  int hash(EducationRecord? e) => const ListEquality().hash([
        e?.degree,
        e?.collegename,
        e?.branch,
        e?.startyear,
        e?.endyear,
        e?.usereducation
      ]);

  @override
  bool isValidKey(Object? o) => o is EducationRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idsConcatenated" field.
  String? _idsConcatenated;
  String get idsConcatenated => _idsConcatenated ?? '';
  bool hasIdsConcatenated() => _idsConcatenated != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "arrayOfPeopleInConversation" field.
  List<String>? _arrayOfPeopleInConversation;
  List<String> get arrayOfPeopleInConversation =>
      _arrayOfPeopleInConversation ?? const [];
  bool hasArrayOfPeopleInConversation() => _arrayOfPeopleInConversation != null;

  // "expireTime" field.
  String? _expireTime;
  String get expireTime => _expireTime ?? '';
  bool hasExpireTime() => _expireTime != null;

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  void _initializeFields() {
    _idsConcatenated = snapshotData['idsConcatenated'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _arrayOfPeopleInConversation =
        getDataList(snapshotData['arrayOfPeopleInConversation']);
    _expireTime = snapshotData['expireTime'] as String?;
    _senderId = snapshotData['senderId'] as String?;
    _receiverId = snapshotData['receiverId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? idsConcatenated,
  DateTime? time,
  String? lastMessage,
  String? expireTime,
  String? senderId,
  String? receiverId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idsConcatenated': idsConcatenated,
      'time': time,
      'lastMessage': lastMessage,
      'expireTime': expireTime,
      'senderId': senderId,
      'receiverId': receiverId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idsConcatenated == e2?.idsConcatenated &&
        e1?.time == e2?.time &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(
            e1?.arrayOfPeopleInConversation, e2?.arrayOfPeopleInConversation) &&
        e1?.expireTime == e2?.expireTime &&
        e1?.senderId == e2?.senderId &&
        e1?.receiverId == e2?.receiverId;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.idsConcatenated,
        e?.time,
        e?.lastMessage,
        e?.arrayOfPeopleInConversation,
        e?.expireTime,
        e?.senderId,
        e?.receiverId
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}

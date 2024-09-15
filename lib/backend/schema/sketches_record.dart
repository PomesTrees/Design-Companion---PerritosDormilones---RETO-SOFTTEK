import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SketchesRecord extends FirestoreRecord {
  SketchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sketch" field.
  String? _sketch;
  String get sketch => _sketch ?? '';
  bool hasSketch() => _sketch != null;

  // "replicateOutput" field.
  String? _replicateOutput;
  String get replicateOutput => _replicateOutput ?? '';
  bool hasReplicateOutput() => _replicateOutput != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "replicatePrompt" field.
  String? _replicatePrompt;
  String get replicatePrompt => _replicatePrompt ?? '';
  bool hasReplicatePrompt() => _replicatePrompt != null;

  // "replicateModel" field.
  String? _replicateModel;
  String get replicateModel => _replicateModel ?? '';
  bool hasReplicateModel() => _replicateModel != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sketch = snapshotData['sketch'] as String?;
    _replicateOutput = snapshotData['replicateOutput'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
    _replicatePrompt = snapshotData['replicatePrompt'] as String?;
    _replicateModel = snapshotData['replicateModel'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sketches')
          : FirebaseFirestore.instance.collectionGroup('sketches');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sketches').doc(id);

  static Stream<SketchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SketchesRecord.fromSnapshot(s));

  static Future<SketchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SketchesRecord.fromSnapshot(s));

  static SketchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SketchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SketchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SketchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SketchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SketchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSketchesRecordData({
  String? sketch,
  String? replicateOutput,
  DateTime? timeCreated,
  String? replicatePrompt,
  String? replicateModel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sketch': sketch,
      'replicateOutput': replicateOutput,
      'timeCreated': timeCreated,
      'replicatePrompt': replicatePrompt,
      'replicateModel': replicateModel,
    }.withoutNulls,
  );

  return firestoreData;
}

class SketchesRecordDocumentEquality implements Equality<SketchesRecord> {
  const SketchesRecordDocumentEquality();

  @override
  bool equals(SketchesRecord? e1, SketchesRecord? e2) {
    return e1?.sketch == e2?.sketch &&
        e1?.replicateOutput == e2?.replicateOutput &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.replicatePrompt == e2?.replicatePrompt &&
        e1?.replicateModel == e2?.replicateModel;
  }

  @override
  int hash(SketchesRecord? e) => const ListEquality().hash([
        e?.sketch,
        e?.replicateOutput,
        e?.timeCreated,
        e?.replicatePrompt,
        e?.replicateModel
      ]);

  @override
  bool isValidKey(Object? o) => o is SketchesRecord;
}

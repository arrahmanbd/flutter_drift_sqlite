// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'note_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isArchiveMeta =
      const VerificationMeta('isArchive');
  @override
  late final GeneratedColumn<int> isArchive = GeneratedColumn<int>(
      'isArchive', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'isFavorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("isFavorite" IN (0, 1))'));
  static const VerificationMeta _editedMeta = const VerificationMeta('edited');
  @override
  late final GeneratedColumn<DateTime> edited = GeneratedColumn<DateTime>(
      'edited', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, note, isArchive, isFavorite, edited];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('note_title')) {
      context.handle(_titleMeta,
          title.isAcceptableOrUnknown(data['note_title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('isArchive')) {
      context.handle(_isArchiveMeta,
          isArchive.isAcceptableOrUnknown(data['isArchive']!, _isArchiveMeta));
    } else if (isInserting) {
      context.missing(_isArchiveMeta);
    }
    if (data.containsKey('isFavorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['isFavorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('edited')) {
      context.handle(_editedMeta,
          edited.isAcceptableOrUnknown(data['edited']!, _editedMeta));
    } else if (isInserting) {
      context.missing(_editedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_title'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      isArchive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isArchive'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}isFavorite'])!,
      edited: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}edited'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String title;
  final String note;
  final int isArchive;
  final bool isFavorite;
  final DateTime edited;
  const Note(
      {required this.id,
      required this.title,
      required this.note,
      required this.isArchive,
      required this.isFavorite,
      required this.edited});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note_title'] = Variable<String>(title);
    map['note'] = Variable<String>(note);
    map['isArchive'] = Variable<int>(isArchive);
    map['isFavorite'] = Variable<bool>(isFavorite);
    map['edited'] = Variable<DateTime>(edited);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      title: Value(title),
      note: Value(note),
      isArchive: Value(isArchive),
      isFavorite: Value(isFavorite),
      edited: Value(edited),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      isArchive: serializer.fromJson<int>(json['isArchive']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      edited: serializer.fromJson<DateTime>(json['edited']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'isArchive': serializer.toJson<int>(isArchive),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'edited': serializer.toJson<DateTime>(edited),
    };
  }

  Note copyWith(
          {int? id,
          String? title,
          String? note,
          int? isArchive,
          bool? isFavorite,
          DateTime? edited}) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        isArchive: isArchive ?? this.isArchive,
        isFavorite: isFavorite ?? this.isFavorite,
        edited: edited ?? this.edited,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isArchive: $isArchive, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('edited: $edited')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, note, isArchive, isFavorite, edited);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.isArchive == this.isArchive &&
          other.isFavorite == this.isFavorite &&
          other.edited == this.edited);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<int> isArchive;
  final Value<bool> isFavorite;
  final Value<DateTime> edited;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.isArchive = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.edited = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String note,
    required int isArchive,
    required bool isFavorite,
    required DateTime edited,
  })  : title = Value(title),
        note = Value(note),
        isArchive = Value(isArchive),
        isFavorite = Value(isFavorite),
        edited = Value(edited);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<int>? isArchive,
    Expression<bool>? isFavorite,
    Expression<DateTime>? edited,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'note_title': title,
      if (note != null) 'note': note,
      if (isArchive != null) 'isArchive': isArchive,
      if (isFavorite != null) 'isFavorite': isFavorite,
      if (edited != null) 'edited': edited,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? note,
      Value<int>? isArchive,
      Value<bool>? isFavorite,
      Value<DateTime>? edited}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isArchive: isArchive ?? this.isArchive,
      isFavorite: isFavorite ?? this.isFavorite,
      edited: edited ?? this.edited,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['note_title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isArchive.present) {
      map['isArchive'] = Variable<int>(isArchive.value);
    }
    if (isFavorite.present) {
      map['isFavorite'] = Variable<bool>(isFavorite.value);
    }
    if (edited.present) {
      map['edited'] = Variable<DateTime>(edited.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isArchive: $isArchive, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('edited: $edited')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $NotesTable notes = $NotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}

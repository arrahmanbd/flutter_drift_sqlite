import 'package:drift/drift.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('note_title')();
  TextColumn get note => text().named('note')();
  IntColumn get isArchive => integer().named('isArchive')();
  BoolColumn get isFavorite => boolean().named('isFavorite')();
  DateTimeColumn get edited => dateTime().named('edited')();
}

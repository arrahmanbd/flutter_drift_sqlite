import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/error/exception.dart';
import '../helper/database.dart';

class DataBaseRepository {
  final AppDatabase appDatabase;

  DataBaseRepository({required this.appDatabase});

  //Get All Records
  Future<List<Note>> fetchAllNotes() async {
    try {
      return await appDatabase.select(appDatabase.notes).get();
    } catch (e) {
      print(e);
      throw DataFetchException("Error fetching notes", innerError: e);
    }
  }

//Fetch Single Record  by id
  Future<Note> fetchSingleNote(int noteid) async {
    return (appDatabase.select(appDatabase.notes)
          ..where((tbl) => tbl.id.equals(noteid)))
        .getSingle();
  }

  //Fetch delete Record  by id
  Future<int> deleteNote(int noteid) async {
    return (appDatabase.delete(appDatabase.notes)
          ..where((tbl) => tbl.id.equals(noteid)))
        .go();
  }

//Searching a record
  Future<List<Note>> searchNotes(String query) async {
    return await (appDatabase.select(appDatabase.notes)
          ..where((tbl) => tbl.title.equals(query)))
        .get();
  }

  //Adding new Record
  Future<int> saveNotes(NotesCompanion data) async {
    return await appDatabase.into(appDatabase.notes).insert(data);
  }

  //Updating a record
  Future<bool> updateNote(NotesCompanion newData) async {
    return await appDatabase.update(appDatabase.notes).replace(newData);
  }
}

final dataBaseProvider = Provider<DataBaseRepository>((ref) {
  final appDatabase = AppDatabase();
  return DataBaseRepository(appDatabase: appDatabase);
});

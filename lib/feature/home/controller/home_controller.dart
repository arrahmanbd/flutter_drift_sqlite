import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/exception.dart';
import '../../../database/helper/database.dart';
import '../../../database/repository/database_repo.dart';

class HomePageNotifier extends StateNotifier<List<Note>> {
  final DataBaseRepository dataBase;
  HomePageNotifier({required this.dataBase}) : super([]);

  void refresh() async {
    List<Note> refresh = await getNotes();
    state = refresh;
  }

  //Get all notes
  Future<List<Note>> getNotes() async {
    try {
      return await dataBase.fetchAllNotes();
    } catch (e) {
      // Handle or rethrow domain-specific exception
      print("Error in getNotes: $e");
      throw AppError("Error loading notes", innerError: e);
      // Rethrow the caught exception
    }
  }

  //Save notes
  Future saveData(NotesCompanion data) async {
    print('note saved to db');
    await dataBase.saveNotes(data);
    refresh(); //refresh
  }

  Future updateData(NotesCompanion data) async {
    print('note updated');
    await dataBase.updateNote(data);
    refresh(); //refresh
  }

  Future deleteNote(int id) async {
    print('note deleted');
    await dataBase.deleteNote(id);
    refresh(); //refresh
  }

  Future<List<Note>> searchNotes(String keywords) async {
    try {
      return await dataBase.searchNotes(keywords);
    } catch (e) {
      // Handle or rethrow domain-specific exception
      print("Error in getNotes: $e");
      throw AppError("Error loading notes", innerError: e);
      // Rethrow the caught exception
    }
  }
}

final homeProvider = StateNotifierProvider<HomePageNotifier, List<Note>>((ref) {
  final dataBase = ref.read(dataBaseProvider);
  return HomePageNotifier(dataBase: dataBase);
});
final notesProvider = FutureProvider<List<Note>>((ref) async {
  return ref.read(homeProvider.notifier).getNotes();
});

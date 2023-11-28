import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:drift_sqflite/database/helper/database.dart';
import 'package:drift_sqflite/feature/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void add() {
      int randomNumber = Random().nextInt(100);
      NotesCompanion note = NotesCompanion(
          title: drift.Value('Title No $randomNumber'),
          note: drift.Value('Take my $randomNumber \'th note'),
          isArchive: const drift.Value(1),
          isFavorite: const drift.Value(true),
          edited: drift.Value(DateTime.now()));
      ref.read(homeProvider.notifier).saveData(note);
    }

    void delete(int id) {
      ref.read(homeProvider.notifier).deleteNote(id);
    }

    void update(int id) {
      NotesCompanion note = NotesCompanion(
          title: const drift.Value('Updated Title No'),
          note: const drift.Value('Take my updated note'),
          isArchive: const drift.Value(1),
          isFavorite: const drift.Value(true),
          edited: drift.Value(DateTime.now()));
      ref.read(homeProvider.notifier).updateData(note);
    }

    Future<void> refresh() async {
      ref.read(homeProvider.notifier).refresh();
    }

    final List<Note> notes = ref.watch(homeProvider);

    // Handle or display the error in the UI
    // void _loadNotes() async {
    //   try {
    //     List<Notes> notes = await homePageController.getNotes();
    //   } catch (e) {
    //     print("Error loading notes: $e");
    //     Utils.showErrorSnackbar(context, e);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drift RoomDatabase'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: notes.isNotEmpty
            ? ListView.separated(
                itemCount: notes.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.purple.withOpacity(.35),
                    height: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onDoubleTap: () => update(notes[index].id),
                    onLongPress: () => delete(notes[index].id),
                    child: ListTile(
                      title: Text(notes[index].title),
                      subtitle: Text(notes[index].note),
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text('No Record')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => add(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

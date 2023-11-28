
# Drift for Room Database

Drift is a powerful database library for Dart and Flutter applications. To support its advanced capabilities like type-safe SQL queries, verification of your database and migrations, it uses a builder and command-line tooling that runs at compile-time.

"Room" refers to a persistence library provided by Google for Android app development. Room is part of the Android Jetpack architecture components and offers an abstraction layer over SQLite to make database operations on Android more straightforward and efficient.

Key components of the Room database include:

Entity: Annotated classes that define the database schema. Each entity corresponds to a table in the database, and each instance of the entity represents a row in that table.

Database: An abstract class that extends RoomDatabase. It serves as the main access point for the underlying SQLite database. The @Database annotation defines the database settings, including the list of entities and the version number.

DAO (Data Access Object): Interface or abstract class annotated with @Dao that contains methods for accessing the database. These methods are used to perform various CRUD (Create, Read, Update, Delete) operations on the entities.

Type Converters: Room provides default type converters for common data types, but you can also define custom type converters for handling non-primitive types.

I provided a brief overview of how Room works:



## Cookbook of Drift

[Drift](https://drift.simonbinder.eu/docs/getting-started/)




## Packages

Packages I used in this project 

```bash
  drift: ^2.13.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.0.0
  path: ^1.8.3
  flutter_riverpod: ^2.4.9
```
Using on dev dependency:

```bash
  drift_dev: ^2.13.0
  build_runner: ^2.4.6
```
Generating Code:

```bash
    dart run build_runner build -d  
```

## How to Use
All you need to know about adding drift to your project.

1. Creating Entity
Annotations or decorators to specify how the entity should be mapped to the database.

```dart
  class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('note_title')();
  TextColumn get note => text().named('note')();
  IntColumn get isArchive => integer().named('isArchive')();
  BoolColumn get isFavorite => boolean().named('isFavorite')();
  DateTimeColumn get edited => dateTime().named('edited')();
}
```
2. Create a DatabaseClass for Drift
To work with Drift in your project, you'll need a DatabaseClass that serves as the main connection to the database. This class should include references to all the tables you intend to use and acts as the main point for Drift's code generation. For this example, let's assume the DatabaseClass is defined in a file named database.dart, located somewhere under the lib/ directory. Feel free to place this class in any Dart file of your choice.

```dart
part 'database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'note.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
```
3. You are ready to use AppDatabase.

## Screenshots

<img src="screenshoot/screenshoot.jpg" alt="App Screenshot" width="400"/>



## 🚀  Follow
[![portfolio](https://img.shields.io/badge/bio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://arrahmanbd.github.io/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/arrahmanbd)
[![linkedin](https://img.shields.io/badge/Github-22272e?style=for-the-badge&logo=github&logoColor=white)](https://www.github.com/arrahmanbd)


## Badges


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)


# note_app
## about
A simple mobile application with a beautiful and friendly UI that allows user to take and edit notes .
Pin the important ones and move unwanted to trash .
## Packages
##### flutter_bloc
##### bloc
##### flutter_screenutil
##### page_transition
##### flutter_animate
##### conditional_builder_null_safety
##### dio
_________________
## models
#### note model
```dart

class NoteModel {
  late int id;
  late String title;
  late String body;
  late String date;
  late int isPinned;
  late int inTrash;

  NoteModel.fromJson(Map<String,dynamic> json){
    id = json['id'] ;
    title = json['title'] ;
    body = json['body'] ;
    date = json['date'] ;
    isPinned = json['is_pinned'] ;
    inTrash = json['in_trash'] ;
  }
}

```
_________________
## features
### get notes
##### code :
```dart
void getNotes() {
    emit(GetNotesLoadingState());
    List<NoteModel> myNotes = [];
    HttpServices.getData(
      url: notesEndpoint,
      query: {},
    ).then(
      (value) {
        value.data.forEach(
          (element) {
            myNotes.add(NoteModel.fromJson(element));
          },
        );
        notes = myNotes;
        emit(GetNotesSuccessState());
      },
    ).catchError(
      (error) {
        emit(GetNotesErrorState(error));
      },
    );
  }
```
After getting notes from the API request, all notes are added to the notes list .
Then, notes are filtered in three categories pinned,unpinned, and inTrash .
##### shots :
<div>
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/aff1c8d4-566b-48b4-a6be-44f17b4d09d5" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/676dda94-20a9-4956-a347-1a555a7d9117" width="200">
</div>

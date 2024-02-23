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


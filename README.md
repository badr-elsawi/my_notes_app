# note_app
## about
A simple mobile application with a beautiful and friendly UI that allows user to take and edit notes .
Pin the important ones and move unwanted to trash .
_____________
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

### add note
##### code :
To add a new note all you just need is to type the note's title an body .

```
void addNote({
    required String title,
    required String body,
  }) async {
    emit(AddNoteLoadingState());
    String formatedDate = DateFormat.yMd().format(DateTime.now()).toString();
    try {
      await HttpServices.postData(
        url: notesEndpoint,
        data: {
          'title': title,
          'body': body,
          'date': formatedDate,
        },
      );
      emit(AddNoteSuccessState());
      getNotes();
    } catch (error) {
      emit(AddNoteErrorState(error.toString()));
    }
  }
```
After adding the note successfully the app will call get notes request to update the notes list
##### shots :
<div>
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/346979e7-ad84-4009-baad-842604bcf996" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/ce90ac8a-1bc2-436c-8bdd-de73f5302ab8" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/8e134078-6cee-4a89-b149-8e89cb0fcbea" width="200">
</div>

### Pin / unpin
In SQL, there isn’t a direct boolean data type. Instead, you work with other data types to achieve similar functionality.
So, " 1 " is used to refer to true and " 0 " refers to false .
The default value of isPinned is " 0 " .
##### code :
```dart
BlocProvider.of<NotesCubit>(context).editNote(
      data: {
        'id': note.id,
        'is_pinned': note.isPinned,
      },
    );
```
When moving any pinned note to trash isPinned changes from " 1 " to " 0 " .
##### shots :
<div>
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/65bb5290-822b-4174-9515-b93c765fd8ff" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/293cfa6d-0ba7-4c8e-a027-94e5d48aba19" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/9696934f-cedb-4574-a5a4-e2a0290ddb63" width="200">
</div>

### edit note
##### code :
```dart
BlocProvider.of<NotesCubit>(context).editNote(
        data: {
          'id' : note.id ,
          'title' : title.text ,
          'body' : body.text ,
        },
      ); 
```
```dart
void editNote({
    required Map<String, dynamic> data,
  }) async {
    emit(EditNotesLoadingState());
    try {
      await HttpServices.putData(
        url: notesEndpoint,
        data: data,
      );
      emit(EditNotesSuccessState());
      getNotes();
    } catch (error) {
      emit(EditNotesErrorState(error.toString()));
    }
  }
```
After editing any note get notes request is called to update the notes list .
##### shots :
<div>
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/c8b87329-9d47-49d3-ab0c-544fd41ed164" width="200">
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/585152f3-3864-440f-8ed5-208424819247" width="200">
</div>

### move to trash
When moving a pinned note to trash isPinned is changed from " 1 " to " 0 "
##### code :
```dart
BlocProvider.of<NotesCubit>(context).editNote(
    data: {
      'id': note.id,
      'in_trash': note.inTrash,
      'is_pinned' : 1 ,
    },
  );
```
After moving a note to trash, there will be two available options 
  - restore the note
  - delete the note permanently
##### screenshots :
<div>
  <img src="https://github.com/badr-elsawi/my_notes_app/assets/88436763/414b7d2d-aa4b-4d03-9720-36a5d223f623" width="200">
</div>

### delete note permanently
This option is available only if the note is in trash .
##### code :
```dart
BlocProvider.of<NotesCubit>(context).deleteNote(
  data: {
    'id': note.id,
    'in_trash': note.inTrash,
  },
);
```
_______________________________________________________
## Packages
##### flutter_bloc
##### bloc
##### flutter_screenutil
##### page_transition
##### flutter_animate
##### conditional_builder_null_safety
##### dio
_______________________
## Dockerizing
### How to dockerize ?
The best available way to dockerize a flutter application is to build the application as a -web application. Then deploy it on a server
##### steps
  - use Ubuntu linux as a base image
  - update packages
  - install git
  - install dependencies
  - clone flutter sdk from the flutter official repo
  - set flutter environment path
  - run flutter doctor
  - enable flutter web
  - copu the project file to the container
  - build flutter web application
  - set the server
##### Dockerfile
```Dockerfile
# Install Operating system and dependencies
FROM ubuntu
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean
# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
# Run flutter doctor
RUN flutter doctor
# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web
# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web
# Record the exposed port
EXPOSE 5000
# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]
ENTRYPOINT [ "/app/server/server.sh"]
```
##### set server script file
``` bash
#!/bin/bash
# Set the port
PORT=5000
# Stop any program currently running on the set port
echo 'preparing port' $PORT '...'
fuser -k 5000/tcp
# switch directories
cd build/web/
# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT
```
### issues while dockerizing
##### issue ! :
  To enable HTTP requests " chrome.dart " in the flutter sdk must be modified ( web security should be enabled )
  - it was solved By gitting a fork from the flutter sdk and modify the " chrome.dart " file then clone the new repo .
##### issue 2 : 
  After cloning flutter sdk from unofficial repo you won't be able to upgrade flutter version .
  - avoid running flutter upgrade
##### issues 3 :
  It was anieve mistake that the API container and the flutter app container were running on the same port
  - All you just need is to change the port of the API container or the app container
_____________________________________________________________________________________

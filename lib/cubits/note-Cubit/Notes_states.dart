import 'package:note_app/models/note_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

// add note states ***************************************
class AddNoteSuccessState extends NotesStates {}

class AddNoteLoadingState extends NotesStates {}

class AddNoteErrorState extends NotesStates {
  final String errorMessage;

  AddNoteErrorState(this.errorMessage);
}

// get notes states *************************************
class GetNotesLoadingState extends NotesStates {}
class GetNotesSuccessState extends NotesStates {}

class GetNotesErrorState extends NotesStates {
  final String error;

  GetNotesErrorState(this.error);
}

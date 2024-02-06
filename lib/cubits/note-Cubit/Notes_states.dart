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

// edit notes states *************************************
class EditNotesLoadingState extends NotesStates {}
class EditNotesSuccessState extends NotesStates {}

class EditNotesErrorState extends NotesStates {
  final String error;

  EditNotesErrorState(this.error);
}

// edit notes states *************************************
class DeleteNotesLoadingState extends NotesStates {}
class DeleteNotesSuccessState extends NotesStates {}

class DeleteNotesErrorState extends NotesStates {
  final String error;

  DeleteNotesErrorState(this.error);
}


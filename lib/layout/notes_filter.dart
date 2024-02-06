import '../models/note_model.dart';

List<NoteModel> filterNotes({
  required String filter,
  required List<NoteModel> notes,
}) {
  List<NoteModel> list = [];
  if (filter == 'is_pinned') {
    notes.forEach(
      (element) {
        if(element.isPinned == 1) {
          list.add(element);
        }
      },
    );
  } else if (filter == 'in_trash') {
    notes.forEach(
          (element) {
        if(element.inTrash == 1) {
          list.add(element);
        }
      },
    );
  } else {
    notes.forEach(
          (element) {
        if(element.inTrash == 0) {
          list.add(element);
        }
      },
    );
  }
  return list;
}

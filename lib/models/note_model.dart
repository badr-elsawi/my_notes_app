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

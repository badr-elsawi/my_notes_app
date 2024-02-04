import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/note_model.dart';
import 'note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) => NoteItem(note: notes[index]),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: notes.length,
      ),
    );
  }
}

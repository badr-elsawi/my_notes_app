import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/view_note_page/view_note_page.dart';
import 'package:note_app/shared/styles/style_constants.dart';
import 'package:page_transition/page_transition.dart';

import '../cubits/note-Cubit/notes_cubit.dart';
import '../shared/components/square_icon_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Animate(

      child: InkWell(
        borderRadius: BorderRadius.circular(20).w,
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: ViewNotePage(note: note),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: StyleConstants.defaultHPadding.w,
            end: StyleConstants.defaultHPadding.w,
            top: 10.h,
            bottom: 15.h,
          ),
          height: 170.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(StyleConstants.borderRadius).w,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0xff109242).withOpacity(0.8),
                Color(0xff6BBA50).withOpacity(0.8),
                // Colors.transparent,
                // Colors.teal.withOpacity(0.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      note.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SquareIconButton(
                    onPressed: () {},
                    icon: Icons.push_pin_rounded,
                    forgroundColor: Colors.lightGreen,
                    size: 40.w,
                    borderWidth: 0,
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(width: 15.w),
                  SquareIconButton(
                    onPressed: () {

                    },
                    icon: Icons.delete_rounded,
                    forgroundColor: Colors.deepOrangeAccent,
                    size: 40.w,
                    borderWidth: 0,
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                note.body,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  note.date,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

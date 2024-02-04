import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/components/square_icon_button.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.iconAction,
    this.hasLeading = false,
    this.iconColor = const Color(0xffF7F7F7),
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Function() iconAction;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xff060E18),
      elevation: 0,
      // collapsedHeight: 70.h,
      stretch: true,
      expandedHeight: 100.h,
      floating: true,
      pinned: true,
      leading: hasLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xffF7F7F7),
              ),
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                // Colors.black.withOpacity(0.7),
                Color(0xff109242).withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        titlePadding: EdgeInsetsDirectional.only(
          start: 20.w,
          top: 10.h,
          bottom: 10.h,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5.h,
          ).w,
          child: SquareIconButton(
            onPressed: iconAction,
            icon: icon,
            forgroundColor: iconColor,
            borderWidth: 0.5,
            size: 40.w,
          ),
        ),
      ],
    );
  }
}

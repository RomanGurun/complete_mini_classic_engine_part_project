import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageFeedback extends StatelessWidget {
  /// One controller per question — wire answers to Bloc/Provider later
  final List<TextEditingController> controllers;

  const ExitPageFeedback({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExitSectionHeader(badge: 'D', title: 'Open-ended Feedback'),
          ExitCard(
            child: Column(
              children: List.generate(
                exitFeedbackQuestions.length,
                (i) => ExitFeedbackBlock(
                  number: i + 1,
                  question: exitFeedbackQuestions[i],
                  controller: controllers[i],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
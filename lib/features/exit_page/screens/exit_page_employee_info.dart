import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageEmployeeInfo extends StatelessWidget {
  // TODO: pass real ExitEmployee model from Bloc/Provider
  const ExitPageEmployeeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final e = dummyEmployee;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExitSectionHeader(badge: 'A', title: 'Employee Information'),
          ExitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExitAutoFilledBadge(),
                // Row 1
                _FieldRow(children: [
                  ExitReadOnlyField(label: 'Employee Name', value: e.name),
                  ExitReadOnlyField(label: 'Employee ID', value: e.employeeId),
                ]),
                SizedBox(height: 12.h),
                // Row 2
                _FieldRow(children: [
                  ExitReadOnlyField(label: 'Job Title', value: e.jobTitle),
                  ExitReadOnlyField(label: 'Department', value: e.department),
                ]),
                SizedBox(height: 12.h),
                // Row 3
                _FieldRow(children: [
                  ExitReadOnlyField(
                      label: 'Direct Supervisor', value: e.supervisor),
                  ExitReadOnlyField(
                      label: 'Date of Joining', value: e.dateOfJoining),
                ]),
                SizedBox(height: 12.h),
                // Row 4
                _FieldRow(children: [
                  ExitReadOnlyField(
                      label: 'Last Working Date', value: e.lastWorkingDate),
                  ExitReadOnlyField(
                      label: 'Interview Date', value: e.interviewDate),
                ]),
                SizedBox(height: 12.h),
                // Row 5
                _FieldRow(children: [
                  ExitReadOnlyField(
                      label: 'Employment Type', value: e.employmentType),
                  ExitReadOnlyField(
                      label: 'Location / Region', value: e.locationRegion),
                ]),
                SizedBox(height: 12.h),
                // Row 6
                _FieldRow(children: [
                  ExitReadOnlyField(
                      label: 'Years of Service', value: e.yearsOfService),
                  ExitReadOnlyField(
                      label: 'Interviewer Name', value: e.interviewerName),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final List<Widget> children;
  const _FieldRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children
          .map((w) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: children.last == w ? 0 : 10.w),
                  child: w,
                ),
              ))
          .toList(),
    );
  }
}
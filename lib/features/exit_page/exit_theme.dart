import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─────────────────────────────────────────
// COLORS
// ─────────────────────────────────────────
class ExitColors {
  static const navy = Color(0xFF0A1628);
  static const blue = Color(0xFF1D6FBF);
  static const blueLight = Color(0xFFEBF3FC);

  static const amber = Color(0xFFE68A00);

  static const green = Color(0xFF3B6D11);
  static const greenLight = Color(0xFFE6F3E8);

  static const red = Color(0xFFA32D2D);
  static const redLight = Color(0xFFFCEBEB);

  static const text = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF5A6272);
  static const textHint = Color(0xFF9AA3B0);

  static const bg = Color(0xFFF4F5F7);
  static const surface = Colors.white;

  static const border = Color(0x1A000000);
  static const borderMed = Color(0x2E000000);

  // Badge bg for auto-filled
  static const autoBadgeBg = Color(0xFFEBF3FC);
  static const autoBadgeFg = Color(0xFF185FA5);
  static const autoBadgeBorder = Color(0xFFB5D4F4);
}

// ─────────────────────────────────────────
// TEXT STYLES
// ─────────────────────────────────────────
class ExitTextStyles {
  static TextStyle label({Color? color}) => GoogleFonts.dmSans(
        fontSize: 10.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: color ?? ExitColors.textMuted,
      );

  static TextStyle body({Color? color, FontWeight weight = FontWeight.w400}) =>
      GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: weight,
        color: color ?? ExitColors.text,
      );

  static TextStyle small({Color? color}) => GoogleFonts.dmSans(
        fontSize: 12,
        color: color ?? ExitColors.textMuted,
      );
}

// ─────────────────────────────────────────
// DUMMY DATA — swap with API models later
// ─────────────────────────────────────────
class ExitEmployee {
  final String name;
  final String employeeId;
  final String jobTitle;
  final String department;
  final String supervisor;
  final String dateOfJoining;
  final String lastWorkingDate;
  final String interviewDate;
  final String employmentType;
  final String locationRegion;
  final String yearsOfService;
  final String interviewerName;

  const ExitEmployee({
    required this.name,
    required this.employeeId,
    required this.jobTitle,
    required this.department,
    required this.supervisor,
    required this.dateOfJoining,
    required this.lastWorkingDate,
    required this.interviewDate,
    required this.employmentType,
    required this.locationRegion,
    required this.yearsOfService,
    required this.interviewerName,
  });
}

const dummyEmployee = ExitEmployee(
  name: 'John Smith',
  employeeId: 'EMP-4821',
  jobTitle: 'Field Technician',
  department: 'Field Operations',
  supervisor: 'Ahmed Al-Rashid',
  dateOfJoining: '12 Mar 2021',
  lastWorkingDate: '31 Mar 2026',
  interviewDate: '26 Mar 2026',
  employmentType: 'Full-time',
  locationRegion: 'Kathmandu',
  yearsOfService: '5.0',
  interviewerName: 'Sara Patel',
);

// Steps
const exitSteps = [
  'Employee Information',
  'Reason for Leaving',
  'Satisfaction Rating',
  'Open Feedback',
  'Signature',
];

// Reasons for leaving
const exitReasons = [
  'Better Compensation / Benefits elsewhere',
  'Career Growth / Promotion opportunity elsewhere',
  'Relocation (personal / family)',
  'Work-Life Balance concerns',
  'Poor Management / Supervision',
  'Lack of Training & Development',
  'Health / Personal reasons',
  'Company Culture / Environment issues',
  'Contract / Project End',
  'Retirement',
  'Other (specify below)',
];

// Rating aspects
const exitRatingAspects = [
  'Overall Job Satisfaction',
  'Compensation & Benefits Package',
  'Career Growth & Promotion Opportunities',
  'Training & Skills Development',
  'Relationship with Direct Supervisor',
  'Teamwork & Collaboration',
  'Company Policies & Procedures',
  'Work-Life Balance',
  'Recognition & Reward System',
  'Communication from Management',
  'Field Safety Standards & Equipment',
  'Vehicle / Transport Provision',
  'Site Tools & Technical Equipment',
  'NOC / Helpdesk Support for Field Issues',
  'Network Outage Handling Procedures',
  'Physical Working Conditions (weather/sites)',
  'Customer Interaction & Etiquette Training',
  'On-call / After-hours Schedule Fairness',
];

// Open-ended feedback questions
const exitFeedbackQuestions = [
  'What did you enjoy most about working as field staff at our ISP?',
  'What were the biggest challenges in the field? (site access, equipment, safety, dispatch)',
  'Were you adequately equipped & trained to handle technical field issues?',
  'How would you describe NOC/helpdesk support when you faced issues in the field?',
  'Did you feel safe working in field conditions? What improvements would you suggest?',
  'What would make our ISP a better place for field technicians?',
  'Would you return to work here if given the chance? Why / why not?',
  'Any additional comments or suggestions for management:',
];
// Flutter imports:

// Dart imports:
import 'dart:convert';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/models/pen/symbol.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension StatusExtension on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isEmpty => this == Status.empty;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
}

extension SubmissionStatusExtension on SubmissionStatus {
  bool get isInitial => this == SubmissionStatus.initial;
  bool get isSubmitting => this == SubmissionStatus.submitting;
  bool get isSuccess => this == SubmissionStatus.success;
  bool get isError => this == SubmissionStatus.error;
}

extension RoutingHandler on BuildContext {
  void handleRouting() {
    pop();
  }
}

extension CaseStatus on bool {
  String get caseStatus => this ? "Open case" : "Closed";
}

extension Date on String {
  String get formattedDate {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
  }
  String get date {
    final parts = split(",");
    return parts.isNotEmpty ? parts[0].trim() : 'Invalid date';
  }

  String get time {
    final parts = split(",");
    return parts.length > 1 ? parts[1].trim() : 'Invalid time';
  }
}

extension DateFunction on DateTime {
  String get date => DateFormat('MMMM dd, yyyy').format(this);
  String get apiDate => DateFormat('yyyy-MM-dd').format(this);
}

extension Conversion on Map<String, dynamic> {
  String get encode => jsonEncode(this);
  Map<String, dynamic> get decode => jsonDecode(toString());
}

extension AgeCalculator on DateTime {
  int calculateAge() {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - year;

    // Check if the birthday has not occurred yet this year
    if (currentDate.month < month ||
        (currentDate.month == month && currentDate.day < day)) {
      age--;
    }

    return age;
  }

  int get age => calculateAge();
}

extension SymbolX on PenSymbol {
  // isApplicable without scaleFactor
  bool isApplicable(double x, double y) {
    return xmin <= x && x <= xmax && ymin <= y && y <= ymax;
  }

  // isApplicable with scaleFactor
  bool isApplicableWithScaleFactor(double x, double y) {
    const deflationFactor = 0.9618171021;
    double refHeight = 128.0;
    double refWidth = 90.0;
    double pageHeight = 7014.0;
    double pageWidth = 4962.0;
    double scaleFactor = min(refHeight / pageHeight, refWidth / pageWidth);
    x *= scaleFactor / deflationFactor;
    y *= scaleFactor / deflationFactor;
    return xmin <= x && x <= xmax && ymin <= y && y <= ymax;
  }
}

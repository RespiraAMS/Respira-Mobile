import 'package:flutter/material.dart';

/// Radius tokens. Source: RESPIRAAMS_DESIGN_SYSTEM.md · 04 Radius.
abstract final class AppRadius {
  static const double smValue = 12;
  static const double mdValue = 16;
  static const double lgValue = 24;
  static const double fullValue = 999;

  static BorderRadius get sm => BorderRadius.circular(smValue);
  static BorderRadius get md => BorderRadius.circular(mdValue);
  static BorderRadius get lg => BorderRadius.circular(lgValue);
  static BorderRadius get full => BorderRadius.circular(fullValue);
}

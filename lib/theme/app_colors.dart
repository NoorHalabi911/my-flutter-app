import 'package:flutter/material.dart';

/// Shared palette for auth screens and Kanban (single source of truth).
abstract final class AppColors {
  static const brandBlue = Color(0xFF2E5D95);
  static const gradientTop = Color(0xFFC493DF);
  static const gradientBottom = Color(0xFF9EDCDF);
  static const headingTint = Color(0xFFF0F6FF);
  static const iconTint = Color(0xFFEFF5FF);

  /// Light panels on gradient (e.g. nested task chips).
  static const softSurface = Color(0xFFEFF5FF);
  static const mutedSlate = Color(0xFF4C6291);
  static const checkboxAccent = Color(0xFF3A5A92);
  static const inputFocusBorder = Color(0xFF2E4C80);
  static const hintSoft = Color(0xFF5D6D9A);
  static const danger = Color(0xFFB00020);
}

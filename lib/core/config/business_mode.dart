import 'package:flutter/material.dart';

class BusinessModeNotifier extends ValueNotifier<bool> {
  // false = Retail (Default), true = F&B (Tables)
  BusinessModeNotifier() : super(false);

  void toggle() {
    value = !value;
  }
}

// Global Singleton for MVP simplicity
final businessModeNotifier = BusinessModeNotifier();

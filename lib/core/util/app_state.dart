import 'package:flutter/material.dart';

class _GlobalContext {
  final context = GlobalKey<NavigatorState>();
}

final appContext = _GlobalContext();

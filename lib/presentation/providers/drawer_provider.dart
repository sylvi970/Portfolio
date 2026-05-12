import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerProvider extends Notifier<GlobalKey<ScaffoldState>> {
  @override
  GlobalKey<ScaffoldState> build() {
    return GlobalKey<ScaffoldState>();
  }

  GlobalKey<ScaffoldState> get key => state;
}

final drawerProviderProv = NotifierProvider<DrawerProvider, GlobalKey<ScaffoldState>>(DrawerProvider.new);

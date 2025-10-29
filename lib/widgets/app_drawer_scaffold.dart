import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:test_project/widgets/custom_drawer.dart';

class AppDrawerScaffold extends StatelessWidget {
  final AdvancedDrawerController drawerController;
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const AppDrawerScaffold({
    super.key,
    required this.drawerController,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF0a8ed9),
      ),
      controller: drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: CustomDrawer(drawerController: drawerController),
      child: Scaffold(
        appBar: AppBar(title: Text(title), actions: actions),
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ostadapp/Features/pages/ongoing_matches_list_page.dart';

class SportsUpdateApp extends StatelessWidget {
  const SportsUpdateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnGoingMatchesListPage(),
    );
  }
}

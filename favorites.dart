import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List saved = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("saved");

    if (data != null) {
      saved = jsonDecode(data);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved News ⭐")),

      body: saved.isEmpty
          ? Center(child: Text("No saved news"))
          : ListView.builder(
              itemCount: saved.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(saved[i]["title"] ?? ""),
                  ),
                );
              },
            ),
    );
  }
}
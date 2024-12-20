import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {
  final Function(String) onSearch;
  final String hintText;
  const SearchViewWidget(
      {super.key, required this.onSearch, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          prefix: const Icon(Icons.search),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

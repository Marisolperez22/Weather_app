import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
      title: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cityController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white38, fontSize: 10),
                hintText: 'City Name',
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              String? cityName = cityController.text.trim();
              if (cityName != '') {
                Navigator.pop(context, cityName);
              }
              return;
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
    ));
  }
}

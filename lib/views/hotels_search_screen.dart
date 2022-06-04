import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/textstyle.dart';

class HotelsSearchScreen extends StatefulWidget {
  const HotelsSearchScreen({Key? key}) : super(key: key);

  @override
  State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
}

class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
  String inputvalue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close, color: whiteColor),
                        ),
                        const Text("Destination", style: white22BoldTextStyle),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: TextField(
                      onChanged: (newvalue) {
                        inputvalue = newvalue;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        fillColor: whiteColor,
                        filled: false,
                        border: InputBorder.none,
                        hintText: "Where are you going?",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: _fecthHotels(inputvalue),
              builder: (context, snaps) {
                switch (snaps.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final List _names =
                        snaps.data!['results']['hotels'] as List;
                    return ListView.builder(
                      itemCount: _names.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(color: Colors.black12),
                          )),
                          child: ListTile(
                            title: Text(_names[index]["locationName"]),
                            // trailing:
                            //     Text("${_names[index]["hotelsCount"]} Hotels"),
                            // subtitle: Text(_names[index]["countryName"]),
                          ),
                        );
                      },
                    );
                  default:
                    return const Center(
                      child: Text("something went wrong"),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  final http.Client _httpClient = http.Client();
  Future<Map<String, dynamic>> _fecthHotels([String city = ""]) async {
    http.Response response;
    Map<String, dynamic> body;
    const _authority = 'engine.hotellook.com';
    final uri = Uri.https(_authority, '/api/v2/lookup.json', {
      "query": city,
      "lang": "en",
      "lookFor": "both",
      "limit": "10",
      "token": "fbafe95f54068fb7b0ffc22e6f523bce",
    });

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    try {
      body = json.decode(response.body) as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }

    return body;
  }
}

class JsonDecodeException implements Exception {}

class HttpException implements Exception {}

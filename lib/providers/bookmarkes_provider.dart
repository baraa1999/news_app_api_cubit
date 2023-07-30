import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_api_cubit/consts/api_consts.dart';
import 'package:news_app_api_cubit/models/bookmarks_model.dart';
import 'package:http/http.dart' as http;

class BookMarkesProvider with ChangeNotifier {
  List<BookmarksModel> bookmarkList = [];

  List<BookmarksModel> get getbookmarkList {
    return bookmarkList;
  }

  Future<void> addToBookmark() async {
    try {
      var uri = Uri.https(BASEURL_FIRBASE, "bookmarks.json");
      var response = await http.post(
        uri,
        body: json.encode({'Test': 'Anytest'}),
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
    } catch (error) {
      rethrow;
    }
  }
}

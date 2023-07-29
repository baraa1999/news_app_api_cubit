import 'package:flutter/material.dart';
import 'package:news_app_api_cubit/models/news_model.dart';
import 'package:news_app_api_cubit/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newList = [];

  List<NewsModel> get getNewsList {
    return newList;
  }

  Future<List<NewsModel>> fetchAllNews(
      {required int pageIndex, required String sortBy}) async {
    newList = await NewsAPiServices.getAllNews(page: pageIndex, sortBy: sortBy);
    return newList;
  }
}

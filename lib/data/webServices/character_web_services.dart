import 'dart:convert';

import 'package:bloc_rick/constant/end_points.dart';
import 'package:bloc_rick/constant/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    // set up dio inside constructer
    final options = BaseOptions(
      //set up settings of http request
      baseUrl: baseUrl, //url
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options); // create dio
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      final response = await dio.get(EndPoints.characters);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

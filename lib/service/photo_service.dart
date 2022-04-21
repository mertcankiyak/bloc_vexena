import 'package:bloc_vexena/extensions/network_string_extension.dart';
import 'package:bloc_vexena/model/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class PhotoService {
  final NetworkManager _networkManager = NetworkManager(
      options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  Future<List<Photos>?> fetchPhotos() async {
    final response = await _networkManager.send<Photos, List<Photos>>(
        NetworkPath.Photos.rawValue,
        parseModel: Photos(),
        method: RequestType.GET);

    return response.data;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:anip_extractor_sample/screens/domain/models/anip_loader_response.dart';
import 'package:anip_extractor_sample/screens/infrastructure/serialization/anip_loader_response_serialization.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

abstract class IAnipLoaderRepository {
  Future<AnipLoaderResponse> extract(File file);
}

class AnipLoaderRepository implements IAnipLoaderRepository {
  static const String apiHost = 'http://34.35.X.X/anip-loader';

  @override
  Future<AnipLoaderResponse> extract(File file) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(apiHost),
      );
      final fileStream = http.MultipartFile(
        'file',
        file.openRead(),
        await file.length(),
        filename: path.basename(file.path),
      );

      request.files.add(fileStream);
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        return AnipLoaderResponseSerialization.fromJson(data);
      }
      throw Exception('Something went wrong');
    } catch (e) {
      throw Exception(e);
    }
  }
}

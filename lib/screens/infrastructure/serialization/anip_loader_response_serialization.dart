import 'package:anip_extractor_sample/screens/domain/models/anip_loader_response.dart';

abstract class AnipLoaderResponseSerialization {
  static AnipLoaderResponse fromJson(Map<String, dynamic> data) {
    return AnipLoaderResponse(
      surname: data['surname'] as String?,
      givenName: data['given_name'] as String?,
      dateOfBirth: data['date_of_birth'] as String?,
      npiFid: data['npi_fid'] as String?,
      sex: data['sex'] as String?,
    );
  }
}

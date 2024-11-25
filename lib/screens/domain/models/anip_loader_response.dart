class AnipLoaderResponse {
  final String? surname;
  final String? givenName;
  final String? dateOfBirth;
  final String? sex;
  final String? npiFid;

  const AnipLoaderResponse({
    required this.surname,
    required this.givenName,
    required this.dateOfBirth,
    required this.npiFid,
    required this.sex,
  });
}

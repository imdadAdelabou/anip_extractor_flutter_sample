import 'dart:developer';
import 'dart:io';

import 'package:anip_extractor_sample/screens/infrastructure/anip_loader_repository.dart';
import 'package:anip_extractor_sample/screens/widgets/custom_text_field.dart';
import 'package:anip_extractor_sample/screens/widgets/file_upload.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonnalInformation extends StatefulWidget {
  const PersonnalInformation({super.key});

  @override
  State<PersonnalInformation> createState() => _PersonnalInformationState();
}

class _PersonnalInformationState extends State<PersonnalInformation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController givenNamesController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController npiController = TextEditingController();
  final IAnipLoaderRepository _anipLoaderRepository = AnipLoaderRepository();
  bool isLoading = false;

  void handleFileUpload() async {
    ///  upload image document
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        isLoading = true;
      });
      try {
        final resultat = await _anipLoaderRepository.extract(file);
        nameController.text = resultat.surname ?? '';
        givenNamesController.text = resultat.givenName ?? '';
        birthDateController.text = resultat.dateOfBirth ?? '';
        sexController.text = resultat.sex ?? '';
        npiController.text = resultat.npiFid ?? '';
      } on Exception catch (e) {
        log(e.toString());
      }
      setState(() {
        isLoading = false;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          Text(
            'Informations personnelles',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Nom',
            controller: nameController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'Prénoms',
            controller: givenNamesController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'Date de naissance',
            controller: birthDateController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'Sexe',
            controller: sexController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'NPI/FLD',
            controller: npiController,
          ),
          const SizedBox(height: 70),
          Center(
            child: FileUpload(
              upload: handleFileUpload,
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

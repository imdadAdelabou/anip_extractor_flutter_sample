import 'package:anip_extractor_sample/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonnalInformation extends StatefulWidget {
  const PersonnalInformation({super.key});

  @override
  State<PersonnalInformation> createState() => _PersonnalInformationState();
}

class _PersonnalInformationState extends State<PersonnalInformation> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

const _color = Colors.blue;

class FileUpload extends StatelessWidget {
  const FileUpload({required this.upload, super.key});

  final VoidCallback upload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: upload,
      child: Container(
        width: 273,
        height: 72,
        decoration: BoxDecoration(
          color: _color.withOpacity(0.1),
          border: Border.all(
            color: _color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/Plus.svg'),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Importer un document',
                    style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _color,
                      height: 26 / 18,
                    ),
                  ),
                  const Text(
                    "Une image de votre anip",
                    style: TextStyle(
                      color: _color,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

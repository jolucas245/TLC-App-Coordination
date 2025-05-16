import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../global/colors.dart';

class CsvFileSelectorWidget extends StatelessWidget {
  final String? fileName;
  final VoidCallback onSelectFile;

  const CsvFileSelectorWidget({
    required this.fileName,
    required this.onSelectFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: DottedBorder(
        strokeWidth: 4,
        color: Colors.grey.shade400,
        strokeCap: StrokeCap.square,
        dashPattern: [8, 8],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: Column(
            children: [
              const Icon(Icons.description_outlined, color: Colors.grey, size: 40),
              const SizedBox(height: 15),
              Text(
                fileName ?? "Clique para selecionar",
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: onSelectFile,
                style: OutlinedButton.styleFrom(
                  overlayColor: AppColors.ORANGE,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  "Selecionar Arquivo",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../global/custom_scaffold.dart';
import '../../models/cursista_model.dart';
import '../../viewmodels/import_view_model.dart';
import '../auth/widgets/snackbar_widget.dart';
import 'widgets/csv_file_selector_widget.dart';

  class ImportView extends StatelessWidget {

    const ImportView({super.key});

    @override
    Widget build(BuildContext context) {

    return CustomScaffold(
      title: "Importar Dados",
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Importar Arquivo CSV",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(
                "Selecione o arquivo CSV exportado do Google Forms para importar os dados dos cursistas.",
                softWrap: true,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade600
                ),
              ),
              SizedBox(height: 20,),
              Selector<ImportViewModel, String?>(
                selector: (_, vm) => vm.fileName,
                builder: (context, fileName, _) {
                  return CsvFileSelectorWidget(
                    fileName: fileName, 
                    onSelectFile: () async {
                      final vm = context.read<ImportViewModel>();
                      final status = await vm.uploadCsvFile();
                      if (!context.mounted) return;
      
                      if (status == CsvImportStatus.success){
                        snackbarWidget("Dados carregados com sucesso", context);
                      } else if(status == CsvImportStatus.alreadyProcessed){
                        snackbarWidget("Arquivo já processado", context);
                      }
                      else if (status == CsvImportStatus.cancelled){
                        snackbarWidget("Seleção de arquivo cancelada", context);
                      } else {
                        snackbarWidget("Erro ao importar o arquivo CSV: ${vm.errorMessage}", context);
                        vm.clearError();
                      }
                    }
                  );
                }
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Selector<ImportViewModel, List<CursistaModel>>(
                  selector: (_, vm) => vm.cursistas,
                  builder: (context, cursistas, _){
                    if(cursistas.isEmpty){
                      return SizedBox.shrink();
                    }
                    return OutlinedButton.icon(
                      icon: Icon(Icons.remove_red_eye_outlined, color: Colors.black),
                      onPressed: context.read<ImportViewModel>().isLoading
                          ? null
                          : () async {
                              final vm = context.read<ImportViewModel>();
                              if (vm.selectedFile != null) {
                                if (vm.errorMessage == null && vm.cursistas.isNotEmpty) {                       
                                  context.push('/preview', extra: vm.tableData);
                                }
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      label: Text(
                        "Visualizar dados dos cursistas",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
      
              SizedBox(height: 20,),
              Selector<ImportViewModel, bool>(
                  selector: (_, vm) => vm.isFilePicked,
                  builder: (context, isFilePicked, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          disabledBackgroundColor: Colors.grey
                        ),
                        onPressed: isFilePicked ? () async {
                          
                        } : null, 
                        child: Text(
                          "Importar Dados",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    );
                  }
                ),
      
            ],
          ),
        ),
      ),
    );
  }
}
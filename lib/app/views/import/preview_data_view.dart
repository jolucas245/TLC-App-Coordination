import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../global/custom_scaffold.dart';
import '../../models/cursista_model.dart';
import '../../viewmodels/preview_data_view_model.dart';
import 'widgets/custom_data_cell_widget.dart';
import 'widgets/custom_data_column.dart';

class PreviewDataView extends StatelessWidget {
  final List<CursistaModel> cursistas;

  const PreviewDataView({super.key, required this.cursistas});

  @override
  Widget build(BuildContext context) {
    return Consumer<PreviewDataViewModel>(
      builder: (context, vm, _) {
        return CustomScaffold(
          title: "Visualizar Dados",
          page: "preview",
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text("Zoom"),
                    Expanded(
                      child: Slider(
                        activeColor: AppColors.DARK_BROWN,
                        value: vm.zoom, 
                        min: 0.6,
                        max: 1.0,
                        divisions: 5,
                        label: "${(vm.zoom * 100).toInt()}",
                        onChanged: (value) => vm.setZoom(value)
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        customDataColumnWidget(labelText: 'Nome'),
                        customDataColumnWidget(labelText: 'Data de Nascimento'),
                        customDataColumnWidget(labelText: 'Telefone'),
                        customDataColumnWidget(labelText: 'Endereço'),
                        customDataColumnWidget(labelText: 'Cidade'),
                        customDataColumnWidget(labelText: 'Nome da Mãe'),
                        customDataColumnWidget(labelText: 'Nome do Pai'),
                        customDataColumnWidget(labelText: 'Telefone dos Pais'),
                        customDataColumnWidget(labelText: 'Endereço dos Pais'),
                        customDataColumnWidget(labelText: 'Problema de Saúde'),
                        customDataColumnWidget(labelText: 'Batizado',),
                        customDataColumnWidget(labelText: 'Primeira Comunão'),
                        customDataColumnWidget(labelText: 'Crismado'),
                        customDataColumnWidget(labelText: 'Tamanho da Camiseta'),
                        customDataColumnWidget(labelText: 'Instagram'),
                        customDataColumnWidget(labelText: 'Carimbo')
                      ],
                      rows: List.generate(cursistas.length, (index){
                        final isSelected = vm.seletectIndex == index;

                        return DataRow(
                          color: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states){
                              return isSelected ? Colors.orange.shade100 : null;
                            }
                          ),
                          cells: cursistas[index].toMap().values.map((value) => customDataCellWidget(value.toString(), vm.zoom, ()=>vm.selectRow(index))).toList(),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

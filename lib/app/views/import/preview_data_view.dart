import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../global/custom_scaffold.dart';
import '../../viewmodels/preview_data_view_model.dart';
import 'widgets/custom_data_column.dart';
import 'widgets/custom_data_cell_widget.dart';

class PreviewDataView extends StatelessWidget {
  final List<List<String>> tableData;

  const PreviewDataView({super.key, required this.tableData});

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
                        onChanged: (value) => vm.setZoom(value),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PaginatedDataTable(
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
                    customDataColumnWidget(labelText: 'Batizado'),
                    customDataColumnWidget(labelText: 'Primeira Comunão'),
                    customDataColumnWidget(labelText: 'Crismado'),
                    customDataColumnWidget(labelText: 'Tamanho da Camiseta'),
                    customDataColumnWidget(labelText: 'Instagram'),
                    customDataColumnWidget(labelText: 'Carimbo'),
                  ],
                  source: _PreviewDataSource(tableData, vm.zoom, vm),
                  rowsPerPage: 10,
                  columnSpacing: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PreviewDataSource extends DataTableSource {
  final List<List<String>> tableData;
  final double zoom;
  final PreviewDataViewModel vm;

  _PreviewDataSource(this.tableData, this.zoom, this.vm);

  @override
  DataRow getRow(int index) {
    final row = tableData[index];
    final isSelected = vm.seletectIndex == index;

    return DataRow.byIndex(
      index: index,
      color: WidgetStateProperty.resolveWith<Color?>(
        (states) => isSelected ? Colors.orange.shade100 : null,
      ),
      cells: row
          .map((value) => customDataCellWidget(value, zoom, () => vm.selectRow(index)))
          .toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => tableData.length;
  @override
  int get selectedRowCount => 0;
}

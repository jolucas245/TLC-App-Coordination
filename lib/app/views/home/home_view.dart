import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlc/app/global/custom_appbar.dart';
import 'package:tlc/app/viewmodels/home_view_model.dart';
import 'package:tlc/app/views/home/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: CustomAppbar(
        title: "Cursistas",
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          children: [
            searchWidget(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.shade200,
              ),
              child: Selector<HomeViewModel, int>(
                selector: (_, vm) => vm.selectedIndex,
                builder: (context, selectedIndex, child) {

                  final filters = context.read<HomeViewModel>().filters;

                  return Row(
                    children: List.generate(filters.length, (index) {
                      final isSelected = selectedIndex == index;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: TextButton(
                            onPressed: () => context.read<HomeViewModel>().selectFilter(index),
                            style: TextButton.styleFrom(
                              backgroundColor: isSelected ? Colors.white : Colors.transparent,
                              foregroundColor: isSelected ? Colors.black : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              filters[index],
                              style: TextStyle(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
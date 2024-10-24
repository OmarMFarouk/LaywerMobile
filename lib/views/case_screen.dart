import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermobile/bloc/main_bloc/main_cubit.dart';
import 'package:lawyermobile/bloc/main_bloc/main_states.dart';
import 'package:lawyermobile/src/app_colors.dart';

import '../components/case/details_tile.dart';
import '../components/case/file_grid.dart';

class CaseScreen extends StatelessWidget {
  const CaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
              backgroundColor: AppColors.primary,
              appBar: AppBar(
                backgroundColor: AppColors.litePrimary,
                foregroundColor: AppColors.secondary,
                title: Text(
                  'Case no.${cubit.caseModel!.caseDetails!.caseNumber}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      decoration: BoxDecoration(
                        color: AppColors.litePrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Case Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          Row(
                            children: [
                              DetailsTile(
                                text:
                                    cubit.caseModel!.caseDetails!.caseSubject!,
                                title: 'Case Subject',
                                icon: Icons.subject,
                              ),
                              DetailsTile(
                                text: cubit
                                    .caseModel!.caseDetails!.caseCourtChamber!,
                                title: 'Court Chamber',
                                icon: Icons.confirmation_number,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DetailsTile(
                                text: cubit
                                    .caseModel!.caseDetails!.dateModified!
                                    .split(' ')
                                    .first,
                                title: 'Updated At',
                                icon: Icons.date_range,
                              ),
                              DetailsTile(
                                text: cubit.caseModel!.caseDetails!.caseType!,
                                title: 'Case Type',
                                icon: Icons.category,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.litePrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          const Text(
                            'Case Files',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: GridView.builder(
                                  itemCount: cubit.caseModel!.caseFiles!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 1,
                                  ),
                                  itemBuilder: (context, index) => FileGrid(
                                        fileDetails:
                                            cubit.caseModel!.caseFiles![index]!,
                                        index: index,
                                      )))
                        ]),
                      ),
                    )
                  ])));
        });
  }
}

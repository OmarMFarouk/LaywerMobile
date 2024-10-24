import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermobile/bloc/main_bloc/main_states.dart';
import 'package:lawyermobile/models/case_model.dart';
import 'package:lawyermobile/service/api/case_api.dart';

import '../../src/app_shared.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  TextEditingController uniqueCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CaseModel? caseModel;
  fetchCase() async {
    EasyLoading.show(status: 'Loading..', dismissOnTap: false);
    await CaseApi().fetchCase(caseUnique: uniqueCont.text.trim()).then((res) {
      if (res == null || res == 'error') {
        EasyLoading.dismiss();
        emit(MainFailure('Check Internet Connection'));
      } else if (res['success'] == true) {
        caseModel = CaseModel.fromJson(res);
        FirebaseMessaging.instance
            .subscribeToTopic(caseModel!.caseDetails!.caseId!);
        clearAndSave();
        emit(MainSuccess(res['message']));
        EasyLoading.dismiss();
      } else {
        emit(MainFailure(res['message']));
        EasyLoading.dismiss();
      }
    });
  }

  clearAndSave() async {
    await AppShared.localStorage!
        .setString('caseUnique', uniqueCont.text.trim());
    uniqueCont.clear();
  }
}

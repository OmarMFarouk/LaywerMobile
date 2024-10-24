import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermobile/bloc/main_bloc/main_cubit.dart';
import 'package:lawyermobile/views/welcome_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MainCubit())],
      child: MaterialApp(
        builder: EasyLoading.init(),
        theme: ThemeData(fontFamily: 'Cairo'),
        home: const WelcomeScreen(),
      ),
    );
  }
}

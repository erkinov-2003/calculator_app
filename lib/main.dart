import 'package:calculator_app/src/logic/home_cubit.dart';
import 'package:calculator_app/widget/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  BlocProvider(
    create: (context) => HomeCubit(),
  );
  runApp(const MyApplication());
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_employee_list_transisi/cubit/create_cubit.dart';
import 'package:flutter_employee_list_transisi/cubit/employee_cubit.dart';
import 'package:flutter_employee_list_transisi/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transisi App Testing',
        home: LoginPage(),
      ),
    );
  }
}

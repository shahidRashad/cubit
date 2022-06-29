import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_cubit/project_cubit/cubit/details_cubit.dart';
import 'package:project_cubit/project_cubit/ui/add_page.dart';
import 'package:project_cubit/project_cubit/ui/home_page.dart';
import 'package:project_cubit/project_cubit/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          "/add_page": (context) => AddPage(),
        },
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

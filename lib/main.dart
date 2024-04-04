import 'package:bloc_architecture/data/routes/app_routes.dart';
import 'package:bloc_architecture/screens/home/bloc/home_bloc.dart';
import 'package:bloc_architecture/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(homeRepo: HomeRepository()), lazy: true),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        routerConfig: GoRouter(routes: AppRoutes.routes),
      ),
    );
  }
}

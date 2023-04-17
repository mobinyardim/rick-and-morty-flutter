import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

final routes = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (context, state) {
        return const MainPage(title: "Rick And Morty");
      })
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
        primarySwatch: Colors.blue,
      ),
      routerConfig: routes,
    );
  }
}

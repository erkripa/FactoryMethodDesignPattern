import 'dart:developer';

import 'package:factory_method_pattern/factory/platform_btn.dart';
import 'package:flutter/material.dart';

void main() {
  Employee employee = EmployeeFactory.getEmployee(EmployeeType.boss);
  employee.work();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Factory Method Design Pattern"),
      ),
      body: Column(
        children: [
          ButtonFactory.getButton(TargetPlatform.android).build(
            () => log("On Tap Clicked"),
            const Text("Clik Me"),
          ),
        ],
      ),
    );
  }
}

enum EmployeeType {
  programmer,
  hrManager,
  boss,
}

abstract class Employee {
  void work();
}

class Programmer implements Employee {
  @override
  void work() {
    log("do coding");
  }
}

class HRManager implements Employee {
  @override
  void work() {
    log("Managing all employe");
  }
}

class Boss implements Employee {
  @override
  void work() {
    log("Boss is very Strict");
  }
}

class EmployeeFactory {
  static Employee getEmployee(EmployeeType type) {
    switch (type) {
      case EmployeeType.programmer:
        return Programmer();
      case EmployeeType.hrManager:
        return HRManager();
      case EmployeeType.boss:
        return Boss();
      default:
        return Programmer();
    }
  }
}

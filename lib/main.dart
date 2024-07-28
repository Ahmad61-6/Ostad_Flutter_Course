import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadapp/firebase_messaging_service.dart';
import 'package:ostadapp/firebase_student_app.dart';
import 'package:ostadapp/second_screen.dart';
import 'package:ostadapp/third_screen.dart';

import 'counter_state_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().initialize();
  await FirebaseMessagingService().getFCMToken();
  await FirebaseMessagingService().onRefresh((token) {});
  await FirebaseMessagingService().subscribeToTopic("THE-NEW-BOSTON");

  runApp(const FirebaseStudentApp());
}

class GetDependencyBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CounterStateController());
  }
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX',
      home: const HomePage(),
      initialBinding: GetDependencyBinder(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterStateController counterStateController =
      Get.find<CounterStateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("GetX"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterStateController>(builder: (controller) {
              return Text(
                controller.count.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Get.to(const SecondScreen());
                },
                child: const Text(
                  'Second Screen',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  Get.to(const ThirdScreen());
                },
                child: const Text(
                  'Third Screen',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counterStateController.incrementCount(1);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  String name = '';
  int age = 0;
}

class CounterController extends GetxController {
  var count = 0.obs;
  var isChecked = false.obs;
  var title = ''.obs;
  var user = User().obs;

  @override
  onInit() {
    super.onInit();
    ever(
      count,
      (value) => print('Ever ; $value')
    );
    once(
      count,
      (value) => print('Once ; $value')
    );
    debounce(
      count,
      (value) => print('Debounce ; $value'),
      time: Duration(seconds: 1)
    );
    interval(
      count,
      (value) => print('Interval ; $value'),
      time: Duration(seconds: 1)
    );
  }

  @override
  onClose() {
    super.onClose();
  }
}

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(CounterController());
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<CounterController>(
      builder: (controller) => Container(
        color: Colors.deepOrange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'GetX : ${controller.count}, ${controller.isChecked.value}, ${controller.title.value}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'GetX : ${controller.user.value.name}, ${controller.user.value.age}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.count.value++;
                  if (controller.title.value == 'Hello') {
                    controller.title.value = 'Flutter';
                  } else {
                    controller.title.value = "Hello";
                  }
                  controller.isChecked.value = !controller.isChecked.value;

                  if (controller.user.value.name == 'Lee') {
                    controller.user.value.name = 'Kim';
                  } else {
                    controller.user.value.name = 'Lee';
                  }
                },
                child: Text('Change')
              )
            ],
          ),
        ),
      )
    );
  }
}
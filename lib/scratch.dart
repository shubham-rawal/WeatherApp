import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result;
  print('Task1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 3);

  sleep(threeSeconds);
  String result;
  print('Task2 complete');
}

void task3() {
  String result;
  print('Task3 complete.');
}

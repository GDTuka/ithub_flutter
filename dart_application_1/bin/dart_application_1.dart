import 'dart_class.dart';

class A {
  void printSomething() {
    print('1234');
  }
}

class B extends C {
  @override
  void printSomething() {
    print('4321');
  }
}

void main(List<String> arguments) {
  B b = B();

  b.printSomething();
}

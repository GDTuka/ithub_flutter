class C {
  void _logConsole() {
    print(_getDataToString());
  }

  int _getPrintData() {
    return 1234;
  }

  String _getDataToString() {
    return _getPrintData().toString();
  }

  void printSomething() {
    _logConsole();
  }
}

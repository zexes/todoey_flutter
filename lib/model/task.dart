class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false}); // very key

  void toggleDone() {
    isDone = !isDone;
  }
}

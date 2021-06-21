import 'dart:indexed_db';

class Subject {
  List<Observer> observers = <Observer>[];
  int? state;

  int? getState() {
    return state;
  }

  void setState(int state) {
    this.state = state;
    notifyAllObservers();
  }

  void attach(Observer observer) {
    observers.add(observer);
  }

  void notifyAllObservers() {
    for (Observer observer in observers) {
      // observer.updateMethod();
    }
  }
}

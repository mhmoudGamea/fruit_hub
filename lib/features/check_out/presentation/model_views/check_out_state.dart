abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}

// pages views section
class PageViewChanged extends CheckOutState {
  PageViewChanged();
}

// shipping section
class PayWithCach extends CheckOutState {}

class PayWithCard extends CheckOutState {}

// address section
class SaveMyAddress extends CheckOutState {}

class DontSaveMyAddress extends CheckOutState {}

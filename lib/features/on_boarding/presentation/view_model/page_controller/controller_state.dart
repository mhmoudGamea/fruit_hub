abstract class ControllerState {}

class PageChangeInitial extends ControllerState {}

class PageChanged extends ControllerState {
  final bool isVisible;
  PageChanged({required this.isVisible});
}

class PageNotChanged extends ControllerState {
  final bool isVisible;
  PageNotChanged({required this.isVisible});
}

class MenuModel {
  int id;
  String title;
  String route;
  String? icon;
  int? countTask;
  bool select;
  Object? arguments;

  MenuModel({
    required this.id,
    required this.title,
    this.route = '',
    this.icon,
    this.countTask,
    this.select = false,
    this.arguments,
  });
}

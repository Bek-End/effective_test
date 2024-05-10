abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();
  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get airplaneUp => '$basePath/airplane_up.svg';
  String get airplane => '$basePath/airplane.svg';
  String get arrowLeft => '$basePath/arrow_left.svg';
  String get arrowRightIos => '$basePath/arrow_right_ios.svg';
  String get bellOutlined => '$basePath/bell_outlined.svg';
  String get bell => '$basePath/bell.svg';
  String get calendar => '$basePath/calendar.svg';
  String get checkRounded => '$basePath/check_rounded.svg';
  String get close => '$basePath/close.svg';
  String get filter => '$basePath/filter.svg';
  String get fire => '$basePath/fire.svg';
  String get globe => '$basePath/globe.svg';
  String get graffic => '$basePath/graffic.svg';
  String get hotel => '$basePath/hotel.svg';
  String get mapPin => '$basePath/map_pin.svg';
  String get person => '$basePath/person.svg';
  String get search => '$basePath/search.svg';
  String get share => '$basePath/share.svg';
  String get swapUpDown => '$basePath/swap_up_down.svg';
  String get tooltip => '$basePath/tooltip.svg';
  String get track => '$basePath/track.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  List<String> get constImages =>
      List.generate(3, (index) => '$basePath/$index.png');
}

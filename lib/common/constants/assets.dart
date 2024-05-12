abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();
  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String _basePath;

  const _AssetsHolder(this._basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get add => '$_basePath/add.svg';
  String get airplaneUp => '$_basePath/airplane_up.svg';
  String get airplane => '$_basePath/airplane.svg';
  String get arrowLeft => '$_basePath/arrow_left.svg';
  String get arrowRightIos => '$_basePath/arrow_right_ios.svg';
  String get bellOutlined => '$_basePath/bell_outlined.svg';
  String get bell => '$_basePath/bell.svg';
  String get calendar => '$_basePath/calendar.svg';
  String get checkRounded => '$_basePath/check_rounded.svg';
  String get close => '$_basePath/close.svg';
  String get filter => '$_basePath/filter.svg';
  String get fire => '$_basePath/fire.svg';
  String get globe => '$_basePath/globe.svg';
  String get graffic => '$_basePath/graffic.svg';
  String get hotel => '$_basePath/hotel.svg';
  String get mapPin => '$_basePath/map_pin.svg';
  String get person => '$_basePath/person.svg';
  String get search => '$_basePath/search.svg';
  String get share => '$_basePath/share.svg';
  String get swapUpDown => '$_basePath/swap_up_down.svg';
  String get tooltip => '$_basePath/tooltip.svg';
  String get track => '$_basePath/track.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  List<String> get constImages =>
      List.generate(3, (index) => '$_basePath/$index.png');
  List<String> get constImages2 =>
      List.generate(3, (index) => '$_basePath/${index}0.png');
}

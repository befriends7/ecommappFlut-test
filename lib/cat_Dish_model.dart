
class cat_Dish_model {

  String _dish_name;
  String _dish_price;
  String _dish_image;
  String _dish_currency;
  String _dish_calories;
  String _dish_description;
  int _counter;
  List _addonCat;

  cat_Dish_model(
      this._dish_name,
      this._dish_price,
      this._dish_image,
      this._dish_currency,
      this._dish_calories,
      this._dish_description,
      this._counter,
      this._addonCat);


  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  List get addonCat => _addonCat;

  set addonCat(List value) {
    _addonCat = value;
  }

  String get dish_description => _dish_description;

  set dish_description(String value) {
    _dish_description = value;
  }

  String get dish_calories => _dish_calories;

  set dish_calories(String value) {
    _dish_calories = value;
  }

  String get dish_currency => _dish_currency;

  set dish_currency(String value) {
    _dish_currency = value;
  }

  String get dish_image => _dish_image;

  set dish_image(String value) {
    _dish_image = value;
  }

  String get dish_price => _dish_price;

  set dish_price(String value) {
    _dish_price = value;
  }

  String get dish_name => _dish_name;

  set dish_name(String value) {
    _dish_name = value;
  }
}
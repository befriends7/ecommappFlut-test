

class orderDetails
{

  String _itemName;
  String _price;
  String _numItems;
  String _calItems;

  orderDetails(this._itemName, this._price, this._numItems, this._calItems);

  String get calItems => _calItems;

  set calItems(String value) {
    _calItems = value;
  }

  String get numItems => _numItems;

  set numItems(String value) {
    _numItems = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get itemName => _itemName;

  set itemName(String value) {
    _itemName = value;
  }
}
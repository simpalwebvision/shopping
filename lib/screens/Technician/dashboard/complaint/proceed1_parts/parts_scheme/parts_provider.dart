import 'package:flutter/material.dart';
import 'package:shopping/models/add_check_model.dart';
import 'package:shopping/models/cmc_part_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/common_signature_pad.dart';

class PartsProvider with ChangeNotifier {
  final List<AddPartModel> _finallist = [];
  final List<AddCheckModel> _chequeList = [];
  double _total = 4500.0, _totalAmount = 0.0, _gstTotalAmt = 0.0;
  dynamic _bytes;
  int _sliding = 0;

  dynamic get bytes => _bytes;
  int get sliding => _sliding;
  List<AddPartModel> get finallist => [..._finallist];
  List<AddCheckModel> get chequeList => [..._chequeList];
  double get total => _total;
  double get totalAmount => _totalAmount;
  double get gstTotalAmt => _gstTotalAmt;

  void addPartsFunction({
    required bool fromAddParts,
    required String partName,
    required String partPrice,
    required String partQuantity,
    required String discount,
  }) {
    _finallist.add(AddPartModel(
        pname: partName,
        price: partPrice,
        quantity: partQuantity,
        fromAddPARTS: fromAddParts));
    _total = 4500.0;

    for (var val in finallist) {
      if (!val.fromAddPARTS) {
        var parTotal = double.parse(val.price!) * double.parse(val.quantity!);
        _total += parTotal;
      }
    }
    if (discount != "") {
      discountOnChangedFunction(discount);
    } else {
      _totalAmount = 0.0;
    }

    if (_gstTotalAmt != 0.0) {
      _gstTotalAmt = 0.0;
    }

    notifyListeners();
  }

  void removePart(index, pname, discount) {
    _finallist.removeWhere((element) => element.pname == pname);
    _total = 4500.0;
    if (_finallist.isNotEmpty) {
      for (var val in _finallist) {
        if (!val.fromAddPARTS) {
          var parTotal = double.parse(val.price!) * double.parse(val.quantity!);
          _total += parTotal;
        }
      }
      if (discount != "") {
        discountOnChangedFunction(discount);
      } else {
        _totalAmount = 0.0;
      }
      if (_gstTotalAmt != 0.0) {
        _gstTotalAmt = 0.0;
      }
      notifyListeners();
    } else {
      resetValue();
      notifyListeners();
    }
  }

  void discountOnChangedFunction(value) {
    _totalAmount = CommonFunctions.discountOnChangedFunction(value, _total);
    if (_gstTotalAmt != 0.0) {
      _gstTotalAmt = 0.0;
    }
    notifyListeners();
  }

  void resetValue() {
    _finallist.clear();
    _chequeList.clear();
    _total = 0.0;
    _totalAmount = 0.0;
    _gstTotalAmt = 0.0;
    _sliding = 0;
    _bytes = null;
  }

  void onAddButtonClick(tmpValue) {
    var temporary = tmpValue!.replaceAll('%', '');
    if (temporary != "") {
      if (_totalAmount == 0.0) {
        var amt = (_total * int.parse(temporary)) / 100;
        _gstTotalAmt = _total + amt;
      } else {
        var amt = (_totalAmount * int.parse(temporary)) / 100;
        _gstTotalAmt = _totalAmount + amt;
      }
    }
    notifyListeners();
  }

  void onSubtractButtonClick(tmpValue) {
    var temporary = tmpValue!.replaceAll('%', '');
    if (temporary != "") {
      if (_totalAmount == 0.0) {
        var amt = (_total - (_total * (100 / (100 + int.parse(temporary)))));
        _gstTotalAmt = _total - amt;
      } else {
        var amt = (_totalAmount -
            (_totalAmount * (100 / (100 + int.parse(temporary)))));
        _gstTotalAmt = _totalAmount - amt;
      }
    }
    notifyListeners();
  }

  Future<void> navigateToSignaturePad(
      BuildContext context, PartsProvider provider) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CommonSignaturePad()));
    _bytes = result;
    notifyListeners();
  }

  void changeSlidingPosition(val) {
    _sliding = val;
    notifyListeners();
  }

  void addChequeFunction(
      {required String chequeNumb,
      required String chequeAmou,
      required String chequeD}) {
    _chequeList.add(AddCheckModel(
        checkNumber: chequeNumb, checkAmount: chequeAmou, checkDate: chequeD));

    notifyListeners();
  }

  void removeCheque(index, checkNum) {
    _chequeList.removeWhere((element) => element.checkNumber == checkNum);
    notifyListeners();
  }
}

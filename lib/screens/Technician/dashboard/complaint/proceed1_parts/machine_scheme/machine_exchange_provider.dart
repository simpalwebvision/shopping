import 'package:flutter/material.dart';
import 'package:shopping/models/add_check_model.dart';
import 'package:shopping/widgets/common_signature_pad.dart';

class MachineExchangeProvider with ChangeNotifier {
  final List _productData = [
    'Product One',
    'Product Two',
    'Product Three',
    'Product Four',
    'Product Five'
  ];
  List get productData {
    return [..._productData];
  }

  final List _productModelList = [
    'Model One',
    'Model Two',
    'Model Three',
    'Model Four',
    'Model Five'
  ];

  List get productModelList {
    return [..._productModelList];
  }

  final List _accessoriesList = [
    'Accessory One',
    'Accessory Two',
    'Accessory Three',
    'Accessory Four',
    'Accessory Five'
  ];

  List get accessoriesList {
    return [..._accessoriesList];
  }

  int _sliding = 0;
  int get sliding => _sliding;

  void changeSlidingPosition(val) {
    _sliding = val;
    notifyListeners();
  }

  dynamic _bytes;
  dynamic get bytes => _bytes;

  final List<AddCheckModel> _chequeList = [];

  List<AddCheckModel> get chequeList {
    return [..._chequeList];
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

  Future<void> navigateToSignaturePad(
      BuildContext context, MachineExchangeProvider provider) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CommonSignaturePad()));
    _bytes = result;
    notifyListeners();
  }

  void resetValues() {
    _sliding = 0;
    _bytes = null;
  }
}

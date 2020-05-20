import 'package:mobx/mobx.dart';
part 'qrController.g.dart';

class QrController = _QrControllerBase with _$QrController;

abstract class _QrControllerBase with Store {
  
  @observable 
  bool showQR;

  @observable
  String currentQrString;
  changeQrString(String newQrString) => currentQrString = newQrString;


}
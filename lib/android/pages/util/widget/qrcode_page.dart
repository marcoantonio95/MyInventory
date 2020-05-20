import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/util/controllers/qrController.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {

  GlobalKey globalKey = new GlobalKey();
  String _qrString;

 final qrController = GetIt.I.get<QrController>();

  @override
  void initState() {
    debugPrint("initiated ${this}");
    _qrString = qrController.currentQrString;
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("Disposed ${this}");
    super.dispose();
  }

  _qrcodeWidget() {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return  Container(
      color: const Color(0xFFFFFFFF),
      child:  Column(
        children: <Widget>[
          Expanded(
            child:  Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: _qrString,
                  size: 0.5 * bodyHeight,
                  errorStateBuilder: (cxt, err) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Ocorreu um erro inesperado",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: _qrcodeWidget(),
    );
  }

  
}
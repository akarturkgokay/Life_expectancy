import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
    final UserData _userdata;
    ResultPage(this._userdata);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(_userdata).hesaplama()!.round().toString(),
              style: kMetinStili,
            )),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              child: Text(
                'GERİ DÖN',
                style: kMetinStili,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/resul_page.dart';
import 'package:life_expectancy/user_data.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 7;
  double yapilanSpor = 2;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Yaşam Beklentisi',
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('BOY'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('KİLO'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Haftada Kaç Gün Spor Yapıyorsunuz?',
                      style: kMetinStili,
                    ),
                    Text(
                      '${yapilanSpor.round()}',
                      style: kSayiStili,
                    ),
                    Slider(
                      value: yapilanSpor,
                      onChanged: (double newValue) {
                        setState(() {
                          yapilanSpor = newValue;
                        });
                      },
                      min: 0,
                      max: 7,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz?',
                      style: kMetinStili,
                    ),
                    Text(
                      '${icilenSigara.round()}',
                      style: kSayiStili,
                    ),
                    Slider(
                      value: icilenSigara,
                      min: 0,
                      max: 50,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                      },
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.lightBlue[800]
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: 'KADIN',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'ERKEK';
                        });
                      },
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.lightBlue[800]
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: 'ERKEK',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        UserData(
                            boy: boy,
                            kilo: kilo,
                            yapilanSpor: yapilanSpor,
                            icilenSigara: icilenSigara,
                            seciliCinsiyet: seciliCinsiyet),
                      ),
                    ),
                  );
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinStili,
                ),
              ),
            )
          ],
        ));
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'KİLO' ? kilo-- : boy--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserData {
  String? seciliCinsiyet;
  double icilenSigara;
  double yapilanSpor;
  int boy;
  int kilo;

  UserData(
      {required this.boy,
      required this.icilenSigara,
      required this.kilo,
      this.seciliCinsiyet,
      required this.yapilanSpor});
}

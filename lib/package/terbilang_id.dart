library terbilang_id;

class TerbilangID {
  final List<String> _digits = [
    "",
    "satu",
    "dua",
    "tiga",
    "empat",
    "lima",
    "enam",
    "tujuh",
    "delapan",
    "sembilan",
    "sepuluh",
    "sebelas",
  ];

  int number;
  String _result = "";

  TerbilangID({required this.number});

  String result() => _convert(number);

  String _convert(int number) {
    if (number < 12) {
      _result = _digits[number];
    } else if (number >= 12 && number <= 19) {
      _result = "${_digits[number % 10]} belas";
    } else if (number >= 20 && number <= 99) {
      _result = "${_convert((number ~/ 10))} puluh ${_digits[number % 10]}";
    } else if (number >= 100 && number <= 199) {
      _result = "seratus ${_convert(number % 100)}";
    } else if (number >= 200 && number <= 999) {
      _result = "${_convert(number ~/ 100)} ratus ${_convert(number % 100)}";
    } else if (number >= 1000 && number <= 1999) {
      _result = "seribu ${_convert(number % 1000)}";
    } else if (number >= 2000 && number <= 999999) {
      _result = "${_convert(number ~/ 1000)} ribu ${_convert(number % 1000)}";
    } else if (number >= 1000000 && number <= 999999999) {
      _result =
          "${_convert(number ~/ 1000000)} juta ${_convert(number % 1000000)}";
    } else if (number >= 1000000000 && number <= 999999999999) {
      _result =
          "${_convert(number ~/ 1000000000)} milyar ${_convert(number % 1000000000)}";
    } else if (number >= 1000000000000 && number <= 999999999999999) {
      _result =
          "${_convert(number ~/ 1000000000000)} trilyun ${_convert(number % 1000000000000)}";
    }
    return _result;
  }
}

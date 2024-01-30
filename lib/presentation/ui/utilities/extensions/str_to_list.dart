extension StrToArray on String {
  List<String> getArraySliceByComma() {
    return split(RegExp(r'[,.]')).toList();
  }
}

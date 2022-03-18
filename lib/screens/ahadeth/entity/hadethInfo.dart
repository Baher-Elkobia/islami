class HadethInfo{
  int hadethNumber;
  String hadethTitle;
  String hadethContent;

  HadethInfo({required this.hadethNumber, required this.hadethContent, required this.hadethTitle});

  @override
  String toString() {
    return 'Number: $hadethNumber, Name:$hadethTitle';
  }
}
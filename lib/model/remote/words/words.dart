class WordsModel {
  final String version;
  final List<String> words;

  WordsModel({
    required this.version,
    required this.words,
  });

  factory WordsModel.fromJson(Map<String, dynamic> json) {
    final list = json["words"] as List;
    final resultList = (list).map((e) => e.toString()).toList();

    return WordsModel(
      version: json["version"].toString(),
      words: resultList,
    );
  }
}
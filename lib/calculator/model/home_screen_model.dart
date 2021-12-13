class HomeScreenModel{
  final int userId;
  final int id;
  final String title;
  final String body;
  HomeScreenModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
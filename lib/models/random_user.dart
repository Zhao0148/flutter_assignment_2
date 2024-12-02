class RandomUser {
  final String name;
  final String id;

  RandomUser({required this.name, required this.id});

  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      name: '${json['name']['first']} ${json['name']['last']}',
      id: json['id']['value'] ?? 'Not available',
    );
  }
}
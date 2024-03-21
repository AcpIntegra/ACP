class FontResponse {
  final String title;
  final double size;
  final int isActive;

  FontResponse({
    required this.title,
    required this.size,
    required this.isActive,
  });

  factory FontResponse.fromJson(Map<String, dynamic> json) => FontResponse(
      title: json['title'] ?? 'Medium',
      size: json['size'] ?? 1.0,
      isActive: json['isActive'] ?? 1);

  factory FontResponse.empty() =>
      FontResponse(title: 'Medium', size: 1.0, isActive: 1);

  Map<String, dynamic> toJson() =>
      {'title': title, 'size': size, 'isActive': isActive};
}

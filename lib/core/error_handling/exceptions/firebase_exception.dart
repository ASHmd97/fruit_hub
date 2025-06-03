class AppFirebaseException implements Exception {
  final String message;

  AppFirebaseException({required this.message});

  @override
  String toString() => "FirebaseException: $message";
}

class ChatMember {
  final String name;
  final String initial;
  final bool isAdmin;

  ChatMember({
    required this.name,
    required this.initial,
    this.isAdmin = false,
  });
}

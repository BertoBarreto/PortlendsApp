class Categoria {
  final int id;
  final String name;
  final String imageUrl;
  final int amount;

  Categoria({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.amount,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['Categoria_ID'] as int,
      name: json['Descricao'] as String,
      imageUrl: '',
      amount: 0,
    );
  }
}

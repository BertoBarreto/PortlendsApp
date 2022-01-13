class SubCategoria {
  final int subcategoriaId;
  final String nome;
  final int amount;

  const SubCategoria({
    required this.subcategoriaId,
    required this.nome,
    required this.amount,
  });

  String getFormatedString() {
    return amount > 0 ? '$nome ($amount)' : nome;
  }
}

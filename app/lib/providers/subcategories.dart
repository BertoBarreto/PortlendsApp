import 'package:portlends/models/subcategory.dart';

class SubCategories {
  final List<SubCategoria> subcategorias;
  const SubCategories({required this.subcategorias});

  List<String> getFormatedStrings() {
    List<String> strings = [];
    for (SubCategoria item in subcategorias) {
      strings.add(item.getFormatedString());
    }
    return strings;
  }
}

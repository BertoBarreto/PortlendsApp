class User {
  static int? uid;
  static String? _nome;
  static int? _idade;
  static String? _contato;
  static String? _email;

  static is_logged_in() {
    return uid != null;
  }

  int get userId {
    return uid ?? -1;
  }

  String get nome {
    return _nome ?? '';
  }

  String get contato {
    return _contato ?? '';
  }

  int get idade {
    return _idade ?? -1;
  }

  String get email {
    return _email ?? '';
  }
}

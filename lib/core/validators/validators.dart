class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  static String? login(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Login obrigatório';
    }

    if (value.length < 3) {
      return 'O login deve ter pelo menos 3 caracteres';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password obrigatório';
    }

    if (value.length < 6) {
      return 'O password deve ter pelo menos 6 caracteres';
    }

    return null;
  }

}

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

}

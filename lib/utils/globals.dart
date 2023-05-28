class GlobalLocationValues {
  static String name = "";
  static String address = "";

  GlobalLocationValues.setLocationValues({required String nameFromPhone, required String addressFromPhone}) {
    name = nameFromPhone;
    address = addressFromPhone;
  }

  GlobalLocationValues.clearLocationValues() {
    name = "";
    address = "";
  }
}

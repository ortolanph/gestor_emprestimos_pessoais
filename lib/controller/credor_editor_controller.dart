import '../entities/credor.dart';

class CredorEditorController {
  bool editMode = false;
  Credor? credor;
  int? credorIndex;

  void newCredor() {
    editMode = false;
    credor = null;
    credorIndex = 0;
  }

  void editCredor(Credor credorToEdit, int thisCredorIndex) {
    editMode = true;
    credorIndex = thisCredorIndex;
    credor = credorToEdit;
  }
}
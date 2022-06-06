abstract class Command {
  void execute();
}

class ButtonSave {
  void save() {
    print('Salvando');
  }
}

class SaveCommand implements Command {
  ButtonSave buttonSave;

  SaveCommand({
    required this.buttonSave,
  });

  @override
  void execute() {
    buttonSave.save();
  }
}

class ButtonOpen {
  void open() {
    print('Abrindo');
  }
}

class OpenCommand implements Command {
  ButtonOpen buttonOpen;

  OpenCommand({
    required this.buttonOpen,
  });

  @override
  void execute() {
    buttonOpen.open();
  }
}

class ButtonClose {
  void close() {
    print('Fechando');
  }
}

class CloseCommand implements Command {
  ButtonClose buttonClose;

  CloseCommand({
    required this.buttonClose,
  });

  @override
  void execute() {
    buttonClose.close();
  }
}

class SimpleRemoteControl {
  late Command slot;

  void setCommand(Command command) {
    slot = command;
  }

  void buttonWasPressed() {
    slot.execute();
  }
}

void main(List<String> args) {
  final remote = SimpleRemoteControl();
  final save = SaveCommand(buttonSave: ButtonSave());
  final open = OpenCommand(buttonOpen: ButtonOpen());
  final close = CloseCommand(buttonClose: ButtonClose());

  remote.setCommand(save);
  remote.buttonWasPressed();
  print('-----------------------------------------');
  remote.setCommand(open);
  remote.buttonWasPressed();
  print('-----------------------------------------');
  remote.setCommand(close);
  remote.buttonWasPressed();
  print('-----------------------------------------');
}

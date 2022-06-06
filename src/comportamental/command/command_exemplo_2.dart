abstract class Command {
  void execute();
}

class Light {
  void on() {
    print('Ligando a luz');
  }

  void off() {
    print('Desligando a luz');
  }
}

class LightOnCommand implements Command {
  Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.on();
  }
}

class LightOffCommand implements Command {
  Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.off();
  }
}

class GarageDoor {
  void up() {
    print('Garagem abrindo');
  }

  void down() {
    print('Garagem fechando');
  }

  void stop() {
    print('Garagem parada');
  }

  void lightOn() {
    print('Garagem ligando a luz');
  }

  void lightOff() {
    print('Garagem desligando a luz');
  }
}

class GarageDoorOpenCommand implements Command {
  GarageDoor garageDoor;

  GarageDoorOpenCommand(this.garageDoor);

  @override
  void execute() {
    garageDoor.up();
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
  var remote = SimpleRemoteControl();

  var light = Light();
  var lightOn = LightOnCommand(light);
  var lightOff = LightOffCommand(light);

  var garageDoor = GarageDoor();
  var garageDoorOpen = GarageDoorOpenCommand(garageDoor);

  remote.setCommand(lightOn);
  remote.buttonWasPressed();
  print('-----------------------------------------');
  remote.setCommand(lightOff);
  remote.buttonWasPressed();
  print('-----------------------------------------');
  remote.setCommand(garageDoorOpen);
  remote.buttonWasPressed();
  print('-----------------------------------------');
}

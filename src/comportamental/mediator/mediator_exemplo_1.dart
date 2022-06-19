abstract class Mediator {
  notify(Component component, String evento);
}

class Component {
  Mediator? mediator;

  Component({this.mediator});

  setMediator(Mediator mediator) {
    mediator = mediator;
  }
}

class Button extends Component {
  Button();

  void click() {
    mediator?.notify(this, 'click');
  }
}

class TextBox extends Component {
  TextBox();

  void change() {
    mediator?.notify(this, 'change');
  }
}

class ControlPanel extends Component {
  ControlPanel();

  void save() {
    mediator?.notify(this, 'save');
  }
}

class MediatorExample1 extends Mediator {
  Button button;
  TextBox textBox;
  ControlPanel controlPanel;

  MediatorExample1({
    required this.button,
    required this.textBox,
    required this.controlPanel,
  }) {
    button.setMediator(this);
    textBox.setMediator(this);
    controlPanel.setMediator(this);
  }

  @override
  notify(Component component, String evento) {
    if (component == button && evento == 'click') {
      textBox.change();
      controlPanel.save();
    } else if (component == textBox && evento == 'change') {
      button.click();
      controlPanel.save();
    } else if (component == controlPanel && evento == 'save') {
      button.click();
      textBox.change();
    }
  }
}

void main(List<String> args) {
  MediatorExample1 mediatorExample1 = MediatorExample1(
    button: Button(),
    textBox: TextBox(),
    controlPanel: ControlPanel(),
  );

  mediatorExample1.button.click();
  mediatorExample1.textBox.change();
  mediatorExample1.controlPanel.save();
}

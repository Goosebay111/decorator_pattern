void main() {
  Pizza basicPizza = TomatoSauce(Mozzarella(PlainPizza()));
  var description = basicPizza.getDescription();
  var cost = basicPizza.getCost();
  print(description);
  print(cost);
}

abstract class Pizza {
  String getDescription();
  double getCost();
}

class PlainPizza implements Pizza {
  @override
  String getDescription() {
    return 'Thin dough';
  }

  @override
  double getCost() {
    return 10.0;
  }
}

abstract class ToppingDecorator implements Pizza {
  Pizza _pizza;

  ToppingDecorator(this._pizza);

  @override
  String getDescription() {
    return _pizza.getDescription();
  }

  @override
  double getCost() {
    return _pizza.getCost();
  }
}

class Mozzarella extends ToppingDecorator {
  Mozzarella(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Mozzarella';
  }

  @override
  double getCost() {
    return _pizza.getCost() + 0.5;
  }
}

class TomatoSauce extends ToppingDecorator {
  TomatoSauce(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Tomato sauce';
  }

  @override
  double getCost() {
    return _pizza.getCost() + 0.35;
  }
}

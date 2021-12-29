void main() {
  Pizza basic = PizzaBase();
  basic = TomatoSauce(basic);
  basic = Mozzarella(basic);
  var basicDescription = basic.getDescription();
  print("Basic pizza: $basicDescription");
  // Pizza basicPizza = Mozzarella(TomatoSauce(PizzaBase('Basic Pizza')));
  // var description = basicPizza.getDescription();
  // var cost = basicPizza.getPrice();
  // print(description);
  // print(cost);
  var menu = PizzaMenu();
  var pizzaToppingList = menu.getPizzaToppingDataMap();
  pizzaToppingList[1]?.toggleSelected();
  pizzaToppingList[2]?.toggleSelected();
  var orderPizza = PizzaMenu().getPizza(2, pizzaToppingList);
  var description = orderPizza.getDescription();
  print(description);
}

class PizzaMenu {
  final Map<int, PizzaToppingData> _pizzaToppingDataMap = {
    1: PizzaToppingData('Basil'),
    2: PizzaToppingData('Mozzarella'),
    3: PizzaToppingData('Olive Oil'),
    4: PizzaToppingData('Oregano'),
    5: PizzaToppingData('Pecorino'),
    6: PizzaToppingData('Pepperoni'),
    7: PizzaToppingData('Sauce'),
  };

  Map<int, PizzaToppingData> getPizzaToppingDataMap() {
    return _pizzaToppingDataMap;
  }

  Pizza getPizza(int index, Map<int, PizzaToppingData> pizzaToppingsDataMap) {
    switch (index) {
      case 0:
        return _getMargherita();
      case 1:
        return _getPepperoni();
      case 2:
        return _getCustom(pizzaToppingsDataMap);
    }

    throw Exception("Index of '$index' does not exist.");
  }

  Pizza _getMargherita() {
    Pizza pizza = PizzaBase();
    pizza = TomatoSauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Basil(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);
    pizza = OliveOil(pizza);

    return pizza;
  }

  Pizza _getPepperoni() {
    Pizza pizza = PizzaBase();
    pizza = TomatoSauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Pepperoni(pizza);
    pizza = Oregano(pizza);

    return pizza;
  }

  Pizza _getCustom(Map<int, PizzaToppingData> pizzaToppingsDataMap) {
    Pizza pizza = PizzaBase();

    if (pizzaToppingsDataMap[1]!.selected) {
      pizza = Basil(pizza);
    }

    if (pizzaToppingsDataMap[2]!.selected) {
      pizza = Mozzarella(pizza);
    }

    if (pizzaToppingsDataMap[3]!.selected) {
      pizza = OliveOil(pizza);
    }

    if (pizzaToppingsDataMap[4]!.selected) {
      pizza = Oregano(pizza);
    }

    if (pizzaToppingsDataMap[5]!.selected) {
      pizza = Pecorino(pizza);
    }

    if (pizzaToppingsDataMap[6]!.selected) {
      pizza = Pepperoni(pizza);
    }

    if (pizzaToppingsDataMap[7]!.selected) {
      pizza = TomatoSauce(pizza);
    }

    return pizza;
  }
}

class PizzaToppingData {
  final String label;
  bool selected = false;

  PizzaToppingData(this.label);

  void toggleSelected() {
    selected = !selected;
  }
}

abstract class Pizza {
  String getDescription();
  double getPrice();
}

class PizzaBase implements Pizza {
  @override
  String getDescription() {
    return 'Thin dough';
  }

  @override
  double getPrice() {
    return 10.0;
  }
}

abstract class ToppingDecorator implements Pizza {
  final Pizza _pizza;

  ToppingDecorator(this._pizza);

  @override
  String getDescription() {
    return _pizza.getDescription();
  }

  @override
  double getPrice() {
    return _pizza.getPrice();
  }
}

class Mozzarella extends ToppingDecorator {
  Mozzarella(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Mozzarella';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.5;
  }
}

class TomatoSauce extends ToppingDecorator {
  TomatoSauce(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Tomato sauce';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.35;
  }
}

class Basil extends ToppingDecorator {
  Basil(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Basil';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.15;
  }
}

class OliveOil extends ToppingDecorator {
  OliveOil(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Olive oil';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.25;
  }
}

class Oregano extends ToppingDecorator {
  Oregano(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Oregano';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.15;
  }
}

class Pecorino extends ToppingDecorator {
  Pecorino(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Pecorino';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.25;
  }
}

class Pepperoni extends ToppingDecorator {
  Pepperoni(Pizza pizza) : super(pizza);

  @override
  String getDescription() {
    return _pizza.getDescription() + ', Pepperoni';
  }

  @override
  double getPrice() {
    return _pizza.getPrice() + 0.35;
  }
}

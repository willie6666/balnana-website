enum Scenario { travel, home, dinner }

enum SplitMode { equal, shares }

class Transfer {
  const Transfer(this.from, this.to, this.amount);
  final int from;
  final int to;
  final int amount;
}

class DemoLedger {
  const DemoLedger({
    this.scenario = Scenario.travel,
    this.amount = 12000,
    this.payer = 0,
    this.mode = SplitMode.equal,
  });
  final Scenario scenario;
  final int amount;
  final int payer;
  final SplitMode mode;
  int get digits => scenario == Scenario.travel ? 0 : 2;
  String get currency => scenario == Scenario.travel ? 'JPY' : 'EUR';
  List<int> get weights => mode == SplitMode.equal ? [1, 1, 1, 1] : [2, 1, 1, 1];

  List<int> get shares {
    final sum = weights.fold(0, (a, b) => a + b);
    final result = weights.map((w) => amount * w ~/ sum).toList();
    var remainder = amount - result.fold(0, (a, b) => a + b);
    final priority = List.generate(4, (i) => i)
      ..sort((a, b) {
        final diff = (amount * weights[b] % sum).compareTo(amount * weights[a] % sum);
        return diff == 0 ? a.compareTo(b) : diff;
      });
    for (final member in priority) {
      if (remainder-- <= 0) break;
      result[member]++;
    }
    return result;
  }

  List<int> get balances {
    final shares = this.shares;
    return List.generate(4, (i) => (i == payer ? amount : 0) - shares[i]);
  }

  List<Transfer> get transfers {
    final remaining = balances.toList();
    final result = <Transfer>[];
    while (true) {
      var from = 0, to = 0;
      for (var i = 1; i < remaining.length; i++) {
        if (remaining[i] < remaining[from]) from = i;
        if (remaining[i] > remaining[to]) to = i;
      }
      if (remaining[from] >= 0) break;
      final amount = -remaining[from] < remaining[to] ? -remaining[from] : remaining[to];
      result.add(Transfer(from, to, amount));
      remaining[from] += amount;
      remaining[to] -= amount;
    }
    return result;
  }

  DemoLedger copyWith({Scenario? scenario, int? amount, int? payer, SplitMode? mode}) => DemoLedger(
    scenario: scenario ?? this.scenario,
    amount: amount ?? this.amount,
    payer: payer ?? this.payer,
    mode: mode ?? this.mode,
  );
  static DemoLedger forScenario(Scenario scenario) => DemoLedger(
    scenario: scenario,
    amount: switch (scenario) {
      Scenario.travel => 12000,
      Scenario.home => 120000,
      Scenario.dinner => 9600,
    },
  );
}

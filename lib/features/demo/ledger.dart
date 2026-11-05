enum Scenario { travel, home, dinner }

enum SplitMode { equal, shares }

class Transfer {
  const Transfer(this.from, this.to, this.amount);
  final int from;
  final int to;
  final int amount;
}

/// One bill in the sample group: who paid it and how the four members share it.
class Expense {
  const Expense({
    this.amount = 12000,
    this.payer = 0,
    this.mode = SplitMode.equal,
    this.shareCounts = const [1, 1, 1, 1],
  });
  final int amount;
  final int payer;
  final SplitMode mode;

  /// Each member's shares in [SplitMode.shares]; kept when switching modes.
  final List<int> shareCounts;
  static const maxShares = 10;
  List<int> get weights => mode == SplitMode.equal ? const [1, 1, 1, 1] : shareCounts;

  /// How many people share the bill.
  int get people => weights.where((w) => w > 0).length;

  /// Whether [member]'s shares can change by [step] without leaving nobody to pay.
  bool canAdjustShares(int member, int step) {
    final next = shareCounts[member] + step;
    if (next < 0 || next > maxShares) return false;
    return shareCounts.fold(0, (a, b) => a + b) + step > 0;
  }

  Expense adjustShares(int member, int step) => !canAdjustShares(member, step)
      ? this
      : copyWith(
          shareCounts: [for (final (i, n) in shareCounts.indexed) i == member ? n + step : n],
        );

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

  /// Transfers needed to pay this bill back on its own: one from everyone else who shares it.
  int get separateTransfers => [
    for (final (i, share) in shares.indexed)
      if (i != payer && share > 0) i,
  ].length;

  Expense copyWith({int? amount, int? payer, SplitMode? mode, List<int>? shareCounts}) => Expense(
    amount: amount ?? this.amount,
    payer: payer ?? this.payer,
    mode: mode ?? this.mode,
    shareCounts: shareCounts ?? this.shareCounts,
  );
}

/// The sample group: a few bills paid by different people, settled together.
class DemoLedger {
  const DemoLedger({
    this.scenario = Scenario.travel,
    this.expenses = const [
      Expense(amount: 48000, payer: 0),
      Expense(amount: 36000, payer: 1),
      Expense(amount: 18600, payer: 2),
      Expense(amount: 9000, payer: 3, mode: SplitMode.shares, shareCounts: [1, 1, 0, 1]),
    ],
    this.selected = 0,
  });
  final Scenario scenario;
  final List<Expense> expenses;

  /// The expense being edited.
  final int selected;
  int get digits => scenario == Scenario.travel ? 0 : 2;
  String get currency => scenario == Scenario.travel ? 'JPY' : 'EUR';
  Expense get current => expenses[selected];

  List<int> get balances => [
    for (var i = 0; i < 4; i++) expenses.fold(0, (sum, expense) => sum + expense.balances[i]),
  ];

  /// The member owed the most, who heads the balance card.
  int get topCreditor {
    final values = balances;
    var top = 0;
    for (var i = 1; i < values.length; i++) {
      if (values[i] > values[top]) top = i;
    }
    return top;
  }

  /// Transfers needed if every bill were paid back separately.
  int get separateTransfers => expenses.fold(0, (sum, e) => sum + e.separateTransfers);

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

  DemoLedger select(int index) => copyWith(selected: index);

  /// Replaces the selected expense with [edit] applied to it.
  DemoLedger edit(Expense Function(Expense) edit) =>
      copyWith(expenses: [for (final (i, e) in expenses.indexed) i == selected ? edit(e) : e]);

  DemoLedger copyWith({Scenario? scenario, List<Expense>? expenses, int? selected}) => DemoLedger(
    scenario: scenario ?? this.scenario,
    expenses: expenses ?? this.expenses,
    selected: selected ?? this.selected,
  );

  static DemoLedger forScenario(Scenario scenario) => switch (scenario) {
    Scenario.travel => const DemoLedger(),
    // The rent is split by room size; the others are split equally.
    Scenario.home => const DemoLedger(
      scenario: Scenario.home,
      expenses: [
        Expense(amount: 180000, payer: 0, mode: SplitMode.shares, shareCounts: [3, 2, 2, 2]),
        Expense(amount: 12640, payer: 1),
        Expense(amount: 8800, payer: 2),
        Expense(amount: 4000, payer: 3),
      ],
    ),
    // Sam skipped the drinks and Alex walked home.
    Scenario.dinner => const DemoLedger(
      scenario: Scenario.dinner,
      expenses: [
        Expense(amount: 14800, payer: 0),
        Expense(amount: 5400, payer: 1, mode: SplitMode.shares, shareCounts: [1, 1, 1, 0]),
        Expense(amount: 2600, payer: 2),
        Expense(amount: 3000, payer: 3, mode: SplitMode.shares, shareCounts: [0, 1, 1, 1]),
      ],
    ),
  };
}

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:promodo/features/home/data/store/timer.notifier.dart';
import 'package:promodo/features/home/data/store/timer.state.dart';



/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [

  ],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

// a helper method to create a ProviderContainer that overrides the authRepositoryProvider

void main() {

  test('should decrease timeRemaining state once timer starts', () async {

    // act
    final timerProvider = NotifierProvider<TimerNotifier, TimerState>(TimerNotifier.new);

    // assert
    // verify that mockFeedsRepository.fetchFeeds was called
    final container = createContainer();
    final timerState = container.read(timerProvider);
    expect(timerState.timeRemaining, timerState.timeInitial);

    // listen to changes int he state while timer is running
    container.listen(timerProvider, (previous, next) {
      /// expect it to decrease
      expect(next.timeRemaining, lessThan(next.timeInitial));
    });

    container.read(timerProvider.notifier).startTimer();


  });

}

part of 'player_cubit.dart';

final List<Map<String, dynamic>> allPlayers = [
 {"name": "Ali Barsik", "country": "Kazakstan"},
 {"name": "Nataly", "country": "Russia"},
 {"name": "Al", "country": "USA"},
 {"name": "Mary", "country": "England"},
 {"name": "Li", "country": "China"},
 {"name": "Maxim", "country": "Poland"},
 {"name": "Danil", "country": "Spain"},
 {"name": "Daria", "country": "Uzbekistan"},

];
sealed class PlayerState {}

final class PlayerInitialState extends PlayerState {
  final List<Map<String, dynamic>> players;
  PlayerInitialState(this.players);
}
final class PlayerFilteredState extends PlayerState {
  final List<Map<String, dynamic>> filteredplayers;
  PlayerFilteredState(this.filteredplayers);
}

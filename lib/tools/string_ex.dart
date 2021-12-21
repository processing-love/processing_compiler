/// @author u
/// @date 2020/6/12.
extension StringEx on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

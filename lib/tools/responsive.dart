/// @author u
/// @date 2020/6/12.

class Responsive {
  static const double desktopBreakpoint = 1150;
  static const double phoneBreakpoint = 600;
  static const double edgeInsetsPhone = 8;
  static const double edgeInsetsTablet = 14;
  static const double edgeInsetsDesktop = 18;

  static double responsiveInsets(double width) {
    if (width < phoneBreakpoint) return edgeInsetsPhone;
    if (width < desktopBreakpoint) return edgeInsetsTablet;
    return edgeInsetsDesktop;
  }
}

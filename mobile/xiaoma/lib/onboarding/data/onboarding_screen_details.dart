import '../onboarding.dart';

final _firstSlide = OnboardContent(
  image: "assets/auth/taxi_driver_flatline.png",
  title: "Your Journey, Our \nPriority",
);
final _secondSlide = OnboardContent(
  image: "assets/auth/order_confirmed.png",
  title: "Fast, Friendly, and On\n Time",
);
final _thirdSlide = OnboardContent(
  image: "assets/auth/happy_news.png",
  title: "Let's make your day\n great with rides",
);

final List<OnboardContent> onboardContentList = [
  _firstSlide,
  _secondSlide,
  _thirdSlide,
];
class OnboardingModel {
  // قائمة البيانات ثابتة لسهولة الوصول
  static List<OnboardingModel> data = [
    OnboardingModel(
      bgImage: "assets/images/background1.jpg",
      contentImage: "assets/images/app_icon_white.png",
      text:
          "مرحباً بك في تطبيق يسر\nتطبيق للإعلان ومعرفة دبلومات ودورات المعاهد",
    ),
    OnboardingModel(
      bgImage: "assets/images/background2.jpg",
      contentImage: "assets/images/Frame33.png",
      text: "يتيح للمعاهد الإعلان عن الدبلومات والدورات المتوفرة لديهم",
    ),
    OnboardingModel(
      bgImage: "assets/images/background3.jpg",
      contentImage: "assets/images/Frame34.png",
      text:
          "يتيح للطلاب مشاهدة إعلانات الدبلومات والدورات المتاحة في المعاهد وحجز مقاعد فيها",
    ),
  ];
  final String bgImage;
  final String contentImage;

  final String text;

  OnboardingModel({
    required this.bgImage,
    required this.contentImage,
    required this.text,
  });
}

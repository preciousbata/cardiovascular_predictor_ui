class HealthTopic {
  final String topic;
  final String url;
  final String imageUrl;

  HealthTopic({
    required this.topic,
    required this.url,
    required this.imageUrl,
  });
}

List<HealthTopic> healthTipsList = [
  HealthTopic(
      topic: 'Fitness Basics',
      imageUrl: 'assets/fitness_svg.svg',
      url: 'https://www.heart.org/en/healthy-living/fitness/fitness-basics'),
  HealthTopic(
      topic: 'Eat Right',
      imageUrl: 'assets/food_svg.svg',
      url:
          'https://www.avonhealthcare.com/10-nutrition-tips-that-will-improve-your-health/'),
  HealthTopic(
      topic: 'Get in shape',
      imageUrl: 'assets/yoga_svg.svg',
      url:
          'https://www.heart.org/en/healthy-living/healthy-eating/losing-weight'),
  HealthTopic(
      topic: 'Build Good Habits',
      imageUrl: 'assets/lifestyle_svg.svg',
      url: 'https://www.heart.org/en/healthy-living/healthy-lifestyle/habits'),
];

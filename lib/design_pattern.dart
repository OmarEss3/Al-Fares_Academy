
abstract class Lesson {
  void details();
}

class QuranLesson extends Lesson {
  @override
  void details() {
    print("Quran Lesson Details");
  }
}

class IslamicStudiesLesson extends Lesson {
  @override
  void details() {
    print("Islamic Studies Lesson Details");
  }
}

class LessonFactory {
  static Lesson createLesson(String type) {
    switch (type) {
      case 'Quran':
        return QuranLesson();
      case 'IslamicStudies':
        return IslamicStudiesLesson();
      default:
        throw Exception('Invalid Lesson Type');
    }
  }
}

//strategy (validator)
//singleton (firebase)
//observer (form submission)
//factory (programmes)


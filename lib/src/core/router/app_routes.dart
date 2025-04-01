enum AppRoutes {
  //Auth
  splash('splash', '/splash'),
  language('language', '/language'),
  login('login', '/login'),
  //Home Student
  mainStudent('main_student', '/main-student'),
  nutritionStudent('nutrition_student', '/nutrition-student'),
  ratingStudent('rating_student', '/rating-student'),
  newDetailsStudent('new_details_student', '/new-details-student'),
  allNewsStudent('all_news_student', '/all-news-student'),
  //Test Student
  simpleTestsStudent('simple_tests_student', '/simple-tests-student'),
  simpleTestStudent('simple_test_student', '/simple-test-student'),
  completedSimpleTestStudent('completed_simple_test_student', '/completed-simple-test-student/:id'),
  iqTestsStudent('iq_tests_student', '/iq-tests-student'),
  iqTestStudent('iq_test_student', '/iq-test-student'),
  completedIqTestStudent('completed_iq_test_student', '/completed-iq-test-student/:id'),
  directionalTestsStudent('directional_tests_student', '/directional-tests-student'),
  directionalTestStudent('directional_test_student', '/directional-test-student'),
  completedDirectionalTestStudent('completed_directional_test_student', '/completed-directional-test-student/:id'),
  scoreTestsStudent('score_tests_student', '/score-tests-student'),
  scoreTestStudent('score_test_student', '/score-test-student'),
  completedScoreTestStudent('completed_score_test_student', '/completed-score-test-student/:id'),
  //Home Teacher
  mainTeacher('main_teacher', '/main-teacher'),
  newDetailsTeacher('new_details_teacher', '/new-details-teacher'),
  allNewsTeacher('all_news_teacher', '/all-news-teacher'),
  //Magazine Teacher
  recordMagazineTeacher('record_magazine_teacher','/record-magazine-teacher/:id/:name/:curator'),
  planTeacher('plan_teacher','/plan-teacher/:id/:name/:quarter'),
  importTeacher('import_teacher','/import-teacher/:id/:quarter'),
  //Test Teacher
  simpleTestsTeacher('simple_tests_teacher', '/simple-tests-teacher'),
  createSimpleTestTeacher('create_simple_test_teacher', '/create-simple-test-teacher/:type'),
  simpleTestDetailsTeacher('simple_test_details_teacher', '/simple-test-details-teacher'),
  studentResultsSimpleTestTeacher('student_results_simple_test_teacher', '/student-results-simple-test-teacher'),
  iqTestsTeacher('iq_tests_teacher', '/iq-tests-teacher'),
  createIqTestTeacher('create_iq_test_teacher', '/create-iq-test-teacher/:type'),
  iqTestDetailsTeacher('iq_test_details_teacher', '/iq-test-details-teacher'),
  studentResultsIqTestTeacher('student_results_iq_test_teacher', '/student-results-iq-test-teacher'),
  directionalTestsTeacher('directional_tests_teacher', '/directional-tests-teacher'),
  createDirectionalTestTeacher('create_directional_test_teacher', '/create-directional-test-teacher/:type'),
  directionalTestDetailsTeacher('directional_test_details_teacher', '/directional-test-details-teacher'),
  studentResultsDirectionalTestTeacher('student_results_directional_test_teacher', '/student-results-directional-test-teacher'),
  scoreTestsTeacher('score_tests_teacher', '/score-tests-teacher'),
  createScoreTestTeacher('create_score_test_teacher', '/create-score-test-teacher/:type'),
  scoreTestDetailsTeacher('score_test_details_teacher', '/score-test-details-teacher'),
  studentResultsScoreTestTeacher('student_results_score_test_teacher', '/student-results-score-test-teacher');


  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}

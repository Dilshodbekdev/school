// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get username {
    return Intl.message(
      'User',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get home {
    return Intl.message(
      'Главная',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Журнал`
  String get book {
    return Intl.message(
      'Журнал',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Тестирование`
  String get task {
    return Intl.message(
      'Тестирование',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Статистики`
  String get statistics {
    return Intl.message(
      'Статистики',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Рекомендации для вас`
  String get recommendationsforyou {
    return Intl.message(
      'Рекомендации для вас',
      name: 'recommendationsforyou',
      desc: '',
      args: [],
    );
  }

  /// `Посмотрите рекомендации от\nискусственного интеллекта`
  String get seeai {
    return Intl.message(
      'Посмотрите рекомендации от\nискусственного интеллекта',
      name: 'seeai',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть`
  String get look {
    return Intl.message(
      'Посмотреть',
      name: 'look',
      desc: '',
      args: [],
    );
  }

  /// `Дневник`
  String get daily {
    return Intl.message(
      'Дневник',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get next {
    return Intl.message(
      'Continue',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Питание`
  String get nutrition {
    return Intl.message(
      'Питание',
      name: 'nutrition',
      desc: '',
      args: [],
    );
  }

  /// `Показать все`
  String get seeAll {
    return Intl.message(
      'Показать все',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Новости школы`
  String get schoolNews {
    return Intl.message(
      'Новости школы',
      name: 'schoolNews',
      desc: '',
      args: [],
    );
  }

  /// `Информация не найдена`
  String get noInfoFound {
    return Intl.message(
      'Информация не найдена',
      name: 'noInfoFound',
      desc: '',
      args: [],
    );
  }

  /// `Bugun`
  String get today {
    return Intl.message(
      'Bugun',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Рейтинг`
  String get rating {
    return Intl.message(
      'Рейтинг',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Посещаемость`
  String get attendance {
    return Intl.message(
      'Посещаемость',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Успеваемость`
  String get appropriation {
    return Intl.message(
      'Успеваемость',
      name: 'appropriation',
      desc: '',
      args: [],
    );
  }

  /// `Средняя\nоценка`
  String get averageRating {
    return Intl.message(
      'Средняя\nоценка',
      name: 'averageRating',
      desc: '',
      args: [],
    );
  }

  /// `Понедельник`
  String get monday {
    return Intl.message(
      'Понедельник',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Вторник`
  String get tuesday {
    return Intl.message(
      'Вторник',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Среда`
  String get wednesday {
    return Intl.message(
      'Среда',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Четверг`
  String get thursday {
    return Intl.message(
      'Четверг',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Пятница`
  String get friday {
    return Intl.message(
      'Пятница',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Четверть`
  String get quarter {
    return Intl.message(
      'Четверть',
      name: 'quarter',
      desc: '',
      args: [],
    );
  }

  /// `Тесты по предметам`
  String get subjectTest {
    return Intl.message(
      'Тесты по предметам',
      name: 'subjectTest',
      desc: '',
      args: [],
    );
  }

  /// `Психологические тесты`
  String get psychologicalTest {
    return Intl.message(
      'Психологические тесты',
      name: 'psychologicalTest',
      desc: '',
      args: [],
    );
  }

  /// `IQ тесты`
  String get iqTest {
    return Intl.message(
      'IQ тесты',
      name: 'iqTest',
      desc: '',
      args: [],
    );
  }

  /// `Основная информация`
  String get main_info {
    return Intl.message(
      'Основная информация',
      name: 'main_info',
      desc: '',
      args: [],
    );
  }

  /// `Год рождения`
  String get yearOfBirth {
    return Intl.message(
      'Год рождения',
      name: 'yearOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get gender {
    return Intl.message(
      'Пол',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Место проживание`
  String get livingPlace {
    return Intl.message(
      'Место проживание',
      name: 'livingPlace',
      desc: '',
      args: [],
    );
  }

  /// `Район`
  String get district {
    return Intl.message(
      'Район',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Улица, дом`
  String get address {
    return Intl.message(
      'Улица, дом',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get phone {
    return Intl.message(
      'Телефон',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Эл.почта`
  String get email {
    return Intl.message(
      'Эл.почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Хобби`
  String get hobby {
    return Intl.message(
      'Хобби',
      name: 'hobby',
      desc: '',
      args: [],
    );
  }

  /// `Завершенные`
  String get completed {
    return Intl.message(
      'Завершенные',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Начатые`
  String get started {
    return Intl.message(
      'Начатые',
      name: 'started',
      desc: '',
      args: [],
    );
  }

  /// `Новые`
  String get newTest {
    return Intl.message(
      'Новые',
      name: 'newTest',
      desc: '',
      args: [],
    );
  }

  /// `до`
  String until(String date) {
    return Intl.message(
      'до',
      name: 'until',
      desc: 'until date',
      args: [date],
    );
  }

  /// `К тесту`
  String get toTest {
    return Intl.message(
      'К тесту',
      name: 'toTest',
      desc: '',
      args: [],
    );
  }

  /// `Наичаньем тест?`
  String get startTest {
    return Intl.message(
      'Наичаньем тест?',
      name: 'startTest',
      desc: '',
      args: [],
    );
  }

  /// `Время теста: `
  String get testTime {
    return Intl.message(
      'Время теста: ',
      name: 'testTime',
      desc: '',
      args: [],
    );
  }

  /// `{minutes} минут`
  String minutes(String minutes) {
    return Intl.message(
      '$minutes минут',
      name: 'minutes',
      desc: 'minutes',
      args: [minutes],
    );
  }

  /// `{pcs} шт`
  String pcs(int pcs) {
    return Intl.message(
      '$pcs шт',
      name: 'pcs',
      desc: 'questions count',
      args: [pcs],
    );
  }

  /// `Вопросы: `
  String get questions {
    return Intl.message(
      'Вопросы: ',
      name: 'questions',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get cancel {
    return Intl.message(
      'Отменить',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Принять`
  String get accept {
    return Intl.message(
      'Принять',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Oldingisi`
  String get previous {
    return Intl.message(
      'Oldingisi',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Keyingisi`
  String get nextOne {
    return Intl.message(
      'Keyingisi',
      name: 'nextOne',
      desc: '',
      args: [],
    );
  }

  /// `Yakunlash`
  String get finish {
    return Intl.message(
      'Yakunlash',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите завершить?`
  String get doYouWantFinish {
    return Intl.message(
      'Вы действительно хотите завершить?',
      name: 'doYouWantFinish',
      desc: '',
      args: [],
    );
  }

  /// `Muvaffaqiyatli saqlandi`
  String get muvaffaqiyatliSaqlandi {
    return Intl.message(
      'Muvaffaqiyatli saqlandi',
      name: 'muvaffaqiyatliSaqlandi',
      desc: '',
      args: [],
    );
  }

  /// `Вы хотите выйти из системы?`
  String get exitAccountText {
    return Intl.message(
      'Вы хотите выйти из системы?',
      name: 'exitAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Классы`
  String get classes {
    return Intl.message(
      'Классы',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `Уважительная причина`
  String get validReason {
    return Intl.message(
      'Уважительная причина',
      name: 'validReason',
      desc: '',
      args: [],
    );
  }

  /// `Без причины`
  String get noReason {
    return Intl.message(
      'Без причины',
      name: 'noReason',
      desc: '',
      args: [],
    );
  }

  /// `Журнал`
  String get magazine {
    return Intl.message(
      'Журнал',
      name: 'magazine',
      desc: '',
      args: [],
    );
  }

  /// `Журналы`
  String get magazines {
    return Intl.message(
      'Журналы',
      name: 'magazines',
      desc: '',
      args: [],
    );
  }

  /// `План`
  String get plan {
    return Intl.message(
      'План',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Мой класс`
  String get myClass {
    return Intl.message(
      'Мой класс',
      name: 'myClass',
      desc: '',
      args: [],
    );
  }

  /// `Подробнее`
  String get readMore {
    return Intl.message(
      'Подробнее',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Класс`
  String get clas {
    return Intl.message(
      'Класс',
      name: 'clas',
      desc: '',
      args: [],
    );
  }

  /// `Предмет`
  String get item {
    return Intl.message(
      'Предмет',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Активные`
  String get active {
    return Intl.message(
      'Активные',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Шаблоны`
  String get template {
    return Intl.message(
      'Шаблоны',
      name: 'template',
      desc: '',
      args: [],
    );
  }

  /// `Выберите оценку`
  String get selectRating {
    return Intl.message(
      'Выберите оценку',
      name: 'selectRating',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clear {
    return Intl.message(
      'Очистить',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Импорт`
  String get import {
    return Intl.message(
      'Импорт',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Дата`
  String get date {
    return Intl.message(
      'Дата',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Домашное задание`
  String get homework {
    return Intl.message(
      'Домашное задание',
      name: 'homework',
      desc: '',
      args: [],
    );
  }

  /// `поле не должно быть пустым`
  String get thefieldmustnotbeempty {
    return Intl.message(
      'поле не должно быть пустым',
      name: 'thefieldmustnotbeempty',
      desc: '',
      args: [],
    );
  }

  /// `Сохранит`
  String get save {
    return Intl.message(
      'Сохранит',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите удалить?`
  String get doYouWontToDelete {
    return Intl.message(
      'Вы действительно хотите удалить?',
      name: 'doYouWontToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Импортировать`
  String get import1 {
    return Intl.message(
      'Импортировать',
      name: 'import1',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить`
  String get download {
    return Intl.message(
      'Загрузить',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `размер файла не должен превышать 3 Мб`
  String get filesizeshouldnotexceed3MB {
    return Intl.message(
      'размер файла не должен превышать 3 Мб',
      name: 'filesizeshouldnotexceed3MB',
      desc: '',
      args: [],
    );
  }

  /// `Столбец`
  String get column {
    return Intl.message(
      'Столбец',
      name: 'column',
      desc: '',
      args: [],
    );
  }

  /// `Срок`
  String get term {
    return Intl.message(
      'Срок',
      name: 'term',
      desc: '',
      args: [],
    );
  }

  /// `ФИО`
  String get fio {
    return Intl.message(
      'ФИО',
      name: 'fio',
      desc: '',
      args: [],
    );
  }

  /// `Оценка`
  String get grade {
    return Intl.message(
      'Оценка',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Номер`
  String get number {
    return Intl.message(
      'Номер',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Вопрос`
  String get question {
    return Intl.message(
      'Вопрос',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Ответ`
  String get answer {
    return Intl.message(
      'Ответ',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Добавить тест`
  String get createTest {
    return Intl.message(
      'Добавить тест',
      name: 'createTest',
      desc: '',
      args: [],
    );
  }

  /// `Основная информация`
  String get basicInfo {
    return Intl.message(
      'Основная информация',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Время для теста`
  String get timeForTest {
    return Intl.message(
      'Время для теста',
      name: 'timeForTest',
      desc: '',
      args: [],
    );
  }

  /// `Время начала`
  String get startredDate {
    return Intl.message(
      'Время начала',
      name: 'startredDate',
      desc: '',
      args: [],
    );
  }

  /// `Время окончания`
  String get endedDate {
    return Intl.message(
      'Время окончания',
      name: 'endedDate',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get description {
    return Intl.message(
      'Описание',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Разброс вопросов`
  String get numberOfQuestions {
    return Intl.message(
      'Разброс вопросов',
      name: 'numberOfQuestions',
      desc: '',
      args: [],
    );
  }

  /// `{index}-вопрос`
  String questionByIndex(int index) {
    return Intl.message(
      '$index-вопрос',
      name: 'questionByIndex',
      desc: 'question by index',
      args: [index],
    );
  }

  /// `{index}-я четверть`
  String quarterByIndex(int index) {
    return Intl.message(
      '$index-я четверть',
      name: 'quarterByIndex',
      desc: 'quarter by index',
      args: [index],
    );
  }

  /// `{index}-неделя`
  String weekByIndex(int index) {
    return Intl.message(
      '$index-неделя',
      name: 'weekByIndex',
      desc: 'week by index',
      args: [index],
    );
  }

  /// `{index}-ответ`
  String answerByIndex(int index) {
    return Intl.message(
      '$index-ответ',
      name: 'answerByIndex',
      desc: 'answer by index',
      args: [index],
    );
  }

  /// `Baholar soni: {count}`
  String ratingCount(int count) {
    return Intl.message(
      'Baholar soni: $count',
      name: 'ratingCount',
      desc: 'rating count',
      args: [count],
    );
  }

  /// `Добавить ответ`
  String get addAnswer {
    return Intl.message(
      'Добавить ответ',
      name: 'addAnswer',
      desc: '',
      args: [],
    );
  }

  /// `должно быть как минимум два ответа`
  String get theremustbeatleasttwoanswers {
    return Intl.message(
      'должно быть как минимум два ответа',
      name: 'theremustbeatleasttwoanswers',
      desc: '',
      args: [],
    );
  }

  /// `должен быть хотя бы один вопрос`
  String get theremustbeatleastonequestion {
    return Intl.message(
      'должен быть хотя бы один вопрос',
      name: 'theremustbeatleastonequestion',
      desc: '',
      args: [],
    );
  }

  /// `Добавить вопрос`
  String get addQuestion {
    return Intl.message(
      'Добавить вопрос',
      name: 'addQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите ответ`
  String get pleaseselectaanswer {
    return Intl.message(
      'Пожалуйста, выберите ответ',
      name: 'pleaseselectaanswer',
      desc: '',
      args: [],
    );
  }

  /// `Детали`
  String get details {
    return Intl.message(
      'Детали',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Направление вопросов`
  String get directionofquestions {
    return Intl.message(
      'Направление вопросов',
      name: 'directionofquestions',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get add {
    return Intl.message(
      'Добавить',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Направление`
  String get direction {
    return Intl.message(
      'Направление',
      name: 'direction',
      desc: '',
      args: [],
    );
  }

  /// `Балл`
  String get ball {
    return Intl.message(
      'Балл',
      name: 'ball',
      desc: '',
      args: [],
    );
  }

  /// `Тесты по направлению`
  String get directionalTests {
    return Intl.message(
      'Тесты по направлению',
      name: 'directionalTests',
      desc: '',
      args: [],
    );
  }

  /// `Тесты по баллам`
  String get scoreTests {
    return Intl.message(
      'Тесты по баллам',
      name: 'scoreTests',
      desc: '',
      args: [],
    );
  }

  /// `Результаты по баллам`
  String get resultsByBall {
    return Intl.message(
      'Результаты по баллам',
      name: 'resultsByBall',
      desc: '',
      args: [],
    );
  }

  /// `От`
  String get from {
    return Intl.message(
      'От',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `До`
  String get to {
    return Intl.message(
      'До',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `должен быть хотя бы один результат подсчета очков`
  String get theremustbeatleastonescoringresult {
    return Intl.message(
      'должен быть хотя бы один результат подсчета очков',
      name: 'theremustbeatleastonescoringresult',
      desc: '',
      args: [],
    );
  }

  /// `Tilni o'zgartirish`
  String get tilniOzgartirish {
    return Intl.message(
      'Tilni o\'zgartirish',
      name: 'tilniOzgartirish',
      desc: '',
      args: [],
    );
  }

  /// `№`
  String get no {
    return Intl.message(
      '№',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Fan nomi`
  String get fanNomi {
    return Intl.message(
      'Fan nomi',
      name: 'fanNomi',
      desc: '',
      args: [],
    );
  }

  /// `Baho`
  String get baho {
    return Intl.message(
      'Baho',
      name: 'baho',
      desc: '',
      args: [],
    );
  }

  /// `SBL`
  String get sbl {
    return Intl.message(
      'SBL',
      name: 'sbl',
      desc: '',
      args: [],
    );
  }

  /// `Dars jadvali`
  String get darsJadvali {
    return Intl.message(
      'Dars jadvali',
      name: 'darsJadvali',
      desc: '',
      args: [],
    );
  }

  /// `Baholanmagan`
  String get baholanmagan {
    return Intl.message(
      'Baholanmagan',
      name: 'baholanmagan',
      desc: '',
      args: [],
    );
  }

  /// `2 балл`
  String get score2 {
    return Intl.message(
      '2 балл',
      name: 'score2',
      desc: '',
      args: [],
    );
  }

  /// `3 балл`
  String get score3 {
    return Intl.message(
      '3 балл',
      name: 'score3',
      desc: '',
      args: [],
    );
  }

  /// `4 балл`
  String get score4 {
    return Intl.message(
      '4 балл',
      name: 'score4',
      desc: '',
      args: [],
    );
  }

  /// `5 балл`
  String get score5 {
    return Intl.message(
      '5 балл',
      name: 'score5',
      desc: '',
      args: [],
    );
  }

  /// `Chorak baho`
  String get chorakBaho {
    return Intl.message(
      'Chorak baho',
      name: 'chorakBaho',
      desc: '',
      args: [],
    );
  }

  /// `Yillik baho`
  String get yillikBaho {
    return Intl.message(
      'Yillik baho',
      name: 'yillikBaho',
      desc: '',
      args: [],
    );
  }

  /// `Yillik\nbaho`
  String get yillikBaho1 {
    return Intl.message(
      'Yillik\nbaho',
      name: 'yillikBaho1',
      desc: '',
      args: [],
    );
  }

  /// `Kelmagan`
  String get kelmagan {
    return Intl.message(
      'Kelmagan',
      name: 'kelmagan',
      desc: '',
      args: [],
    );
  }

  /// `Choraklik\nbaho`
  String get chorakliknbaho {
    return Intl.message(
      'Choraklik\nbaho',
      name: 'chorakliknbaho',
      desc: '',
      args: [],
    );
  }

  /// `Tasdiqlash`
  String get tasdiqlash {
    return Intl.message(
      'Tasdiqlash',
      name: 'tasdiqlash',
      desc: '',
      args: [],
    );
  }

  /// `Bu kunda mazkur dars boʼlmaydi`
  String get buKundaMazkurDarsBolmaydi {
    return Intl.message(
      'Bu kunda mazkur dars boʼlmaydi',
      name: 'buKundaMazkurDarsBolmaydi',
      desc: '',
      args: [],
    );
  }

  /// `Yo'q`
  String get yoq {
    return Intl.message(
      'Yo\'q',
      name: 'yoq',
      desc: '',
      args: [],
    );
  }

  /// `Ha`
  String get ha {
    return Intl.message(
      'Ha',
      name: 'ha',
      desc: '',
      args: [],
    );
  }

  /// `Samarqand Darvoza`
  String get server_school {
    return Intl.message(
      'Samarqand Darvoza',
      name: 'server_school',
      desc: '',
      args: [],
    );
  }

  /// `Chilonzor`
  String get server_school2 {
    return Intl.message(
      'Chilonzor',
      name: 'server_school2',
      desc: '',
      args: [],
    );
  }

  /// `The password must have at least 8 characters`
  String get thePasswordMustHaveAtLeast8Characters {
    return Intl.message(
      'The password must have at least 8 characters',
      name: 'thePasswordMustHaveAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Select a branch`
  String get filialniTanlang {
    return Intl.message(
      'Select a branch',
      name: 'filialniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Изменить хобби`
  String get changeHobby {
    return Intl.message(
      'Изменить хобби',
      name: 'changeHobby',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get changePassword {
    return Intl.message(
      'Изменить пароль',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Старый пароль`
  String get oldPassword {
    return Intl.message(
      'Старый пароль',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPassword {
    return Intl.message(
      'Новый пароль',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Другая роль`
  String get anotherRole {
    return Intl.message(
      'Другая роль',
      name: 'anotherRole',
      desc: '',
      args: [],
    );
  }

  /// `{count} kkal`
  String kcal(int count) {
    return Intl.message(
      '$count kkal',
      name: 'kcal',
      desc: 'rating count',
      args: [count],
    );
  }

  /// `Erkak`
  String get male {
    return Intl.message(
      'Erkak',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Ayol`
  String get famale {
    return Intl.message(
      'Ayol',
      name: 'famale',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

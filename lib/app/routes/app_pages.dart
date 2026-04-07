import 'package:get/get.dart';

import '../modules/VideoLecture/bindings/video_lecture_binding.dart';
import '../modules/VideoLecture/views/video_lecture_view.dart';
import '../modules/admit_card/bindings/admit_card_binding.dart';
import '../modules/admit_card/views/admit_card_view.dart';
import '../modules/attendance/attendanceBoardCards/bindings/attendance_board_cards_binding.dart';
import '../modules/attendance/attendanceBoardCards/views/attendance_board_cards_view.dart';
import '../modules/attendance/attendanceteacher/bindings/attendenceteacher_binding.dart';
import '../modules/attendance/attendanceteacher/teacherAttendance/bindings/teacher_attendance_binding.dart';
import '../modules/attendance/attendanceteacher/teacherAttendance/views/teacher_attendance_view.dart';
import '../modules/attendance/attendanceteacher/views/attendenceteacher_view.dart';
import '../modules/attendance/bindings/attendence_binding.dart';
import '../modules/attendance/views/attendence_view.dart';
import '../modules/chooseOption/bindings/choose_option_binding.dart';
import '../modules/chooseOption/views/choose_option_view.dart';
import '../modules/community/askQuestion/bindings/ask_question_binding.dart';
import '../modules/community/askQuestion/views/ask_question_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/choosePeople/bindings/choose_people_binding.dart';
import '../modules/community/choosePeople/views/choose_people_view.dart';
import '../modules/community/createGroup/bindings/create_group_binding.dart';
import '../modules/community/createGroup/views/create_group_view.dart';
import '../modules/community/groups/bindings/groups_binding.dart';
import '../modules/community/groups/groupDetails/bindings/group_details_binding.dart';
import '../modules/community/groups/groupDetails/views/group_details_view.dart';
import '../modules/community/groups/views/groups_view.dart';
import '../modules/community/messages/bindings/messages_binding.dart';
import '../modules/community/messages/chats/bindings/chats_binding.dart';
import '../modules/community/messages/chats/views/chats_view.dart';
import '../modules/community/messages/views/messages_view.dart';
import '../modules/community/views/community_view.dart';
import '../modules/complain/addComplain/bindings/add_complain_binding.dart';
import '../modules/complain/addComplain/views/add_complain_view.dart';
import '../modules/complain/bindings/complain_binding.dart';
import '../modules/complain/complainDetails/bindings/complain_details_binding.dart';
import '../modules/complain/complainDetails/views/complain_details_view.dart';
import '../modules/complain/views/complain_view.dart';
import '../modules/courses/allCategoryCourses/bindings/all_category_courses_binding.dart';
import '../modules/courses/allCategoryCourses/views/all_category_courses_view.dart';
import '../modules/courses/allCourses/bindings/all_courses_binding.dart';
import '../modules/courses/allCourses/views/all_courses_view.dart';
import '../modules/courses/allTrendingCourses/bindings/all_trending_courses_binding.dart';
import '../modules/courses/allTrendingCourses/views/all_trending_courses_view.dart';
import '../modules/courses/bindings/courses_binding.dart';
import '../modules/courses/courseDetails/bindings/course_details_binding.dart';
import '../modules/courses/courseDetails/views/course_details_view.dart';
import '../modules/courses/views/courses_view.dart';
import '../modules/exam/add_exam/bindings/add_exam_binding.dart';
import '../modules/exam/add_exam/views/add_exam_view.dart';
import '../modules/exam/bindings/exam_binding.dart';
import '../modules/exam/exam_details/bindings/exam_details_binding.dart';
import '../modules/exam/exam_details/views/exam_details_view.dart';
import '../modules/exam/views/exam_view.dart';
import '../modules/fees/bindings/fees_binding.dart';
import '../modules/fees/feesdetails/bindings/feesdetails_binding.dart';
import '../modules/fees/feesdetails/views/feesdetails_view.dart';
import '../modules/fees/views/fees_view.dart';
import '../modules/friends/bindings/friends_binding.dart';
import '../modules/friends/inviteFriends/bindings/invite_friends_binding.dart';
import '../modules/friends/inviteFriends/views/invite_friends_view.dart';
import '../modules/friends/views/friends_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_work/add_homeWork/bindings/add_home_work_binding.dart';
import '../modules/home_work/add_homeWork/views/add_home_work_view.dart';
import '../modules/home_work/bindings/home_work_binding.dart';
import '../modules/home_work/homeworkdetails/bindings/homeworkdetails_binding.dart';
import '../modules/home_work/homeworkdetails/views/homeworkdetails_view.dart';
import '../modules/home_work/views/home_work_view.dart';
import '../modules/idCard/bindings/id_card_binding.dart';
import '../modules/idCard/views/id_card_view.dart';
import '../modules/introductionPage/bindings/introduction_page_binding.dart';
import '../modules/introductionPage/views/introduction_page_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/leaveApplication/addLeaveApplication/bindings/add_leave_application_binding.dart';
import '../modules/leaveApplication/addLeaveApplication/views/add_leave_application_view.dart';
import '../modules/leaveApplication/bindings/leave_application_binding.dart';
import '../modules/leaveApplication/leaveApplicationDetails/bindings/leave_application_details_binding.dart';
import '../modules/leaveApplication/leaveApplicationDetails/views/leave_application_details_view.dart';
import '../modules/leaveApplication/views/leave_application_view.dart';
import '../modules/lectures/bindings/lecture_bindings.dart';
import '../modules/lectures/lectureUpload/bindings/lecture_upload_binding.dart';
import '../modules/lectures/lectureUpload/views/lecture_upload_view.dart';
import '../modules/lectures/views/lecture_views.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mainpage/bindings/mainpage_binding.dart';
import '../modules/mainpage/views/mainpage_view.dart';
import '../modules/notice/bindings/notice_binding.dart';
import '../modules/notice/noticeDetails/bindings/notice_details_binding.dart';
import '../modules/notice/noticeDetails/views/notice_details_view.dart';
import '../modules/notice/views/notice_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/postFeed/bindings/post_feed_binding.dart';
import '../modules/postFeed/views/post_feed_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/helpCenter/bindings/help_center_binding.dart';
import '../modules/profile/helpCenter/views/help_center_view.dart';
import '../modules/profile/myAllCourses/bindings/my_all_courses_binding.dart';
import '../modules/profile/myAllCourses/views/my_all_courses_view.dart';
import '../modules/profile/personalInfo/bindings/personal_info_binding.dart';
import '../modules/profile/personalInfo/views/personal_info_view.dart';
import '../modules/profile/profile_details/bindings/profile_details_binding.dart';
import '../modules/profile/profile_details/views/profile_details_view.dart';
import '../modules/profile/public_profile/bindings/public_profile_binding.dart';
import '../modules/profile/public_profile/views/public_profile_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/categoriesDetails/bindings/categories_details_binding.dart';
import '../modules/quiz/categoriesDetails/views/categories_details_view.dart';
import '../modules/quiz/chooseCategories/bindings/choose_categories_binding.dart';
import '../modules/quiz/chooseCategories/views/choose_categories_view.dart';
import '../modules/quiz/contestLeaderboard/bindings/leaderboard_binding.dart';
import '../modules/quiz/contestLeaderboard/views/leaderboard_view.dart';
import '../modules/quiz/joinCompetition/bindings/join_competition_binding.dart';
import '../modules/quiz/joinCompetition/views/join_competition_view.dart';
import '../modules/quiz/leaderBoard/bindings/leader_boaed_binding.dart';
import '../modules/quiz/leaderBoard/views/leader_board_view.dart';
import '../modules/quiz/multiUserQuiz/bindings/multi_user_quiz_binding.dart';
import '../modules/quiz/multiUserQuiz/views/multi_user_quiz_view.dart';
import '../modules/quiz/normalQuiz/bindings/normal_quiz_binding.dart';
import '../modules/quiz/normalQuiz/views/normal_quiz_view.dart';
import '../modules/quiz/player/bindings/player_binding.dart';
import '../modules/quiz/player/views/player_view.dart';
import '../modules/quiz/questionExam/bindings/question_exam_binding.dart';
import '../modules/quiz/questionExam/views/question_exam_view.dart';
import '../modules/quiz/quizmode/bindings/quizmode_binding.dart';
import '../modules/quiz/quizmode/views/quizmode_view.dart';
import '../modules/quiz/qusAnsReview/bindings/qus_ans_review_binding.dart';
import '../modules/quiz/qusAnsReview/views/qus_ans_review_view.dart';
import '../modules/quiz/singleUserQuiz/bindings/single_user_quiz_binding.dart';
import '../modules/quiz/singleUserQuiz/views/single_user_quiz_view.dart';
import '../modules/quiz/summary/bindings/summary_binding.dart';
import '../modules/quiz/summary/views/summary_view.dart';
import '../modules/quiz/timerQuiz/animateQuiz/bindings/animate_quiz_binding.dart';
import '../modules/quiz/timerQuiz/animateQuiz/views/animate_quiz_view.dart';
import '../modules/quiz/timerQuiz/bindings/timer_quiz_binding.dart';
import '../modules/quiz/timerQuiz/views/timer_quiz_view.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/resultDetails/bindings/result_details_binding.dart';
import '../modules/result/resultDetails/views/result_details_view.dart';
import '../modules/result/teacherAddResult/bindings/teacher_add_result_binding.dart';
import '../modules/result/teacherAddResult/views/teacher_add_result_view.dart';
import '../modules/result/teacherResult/bindings/teacher_result_binding.dart';
import '../modules/result/teacherResult/views/teacher_result_view.dart';
import '../modules/result/views/result_view.dart';
import '../modules/routine/bindings/routine_binding.dart';
import '../modules/routine/views/routine_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subject/bindings/subject_binding.dart';
import '../modules/subject/views/subject_view.dart';
import '../modules/teacherlist/bindings/teacherlist_binding.dart';
import '../modules/teacherlist/views/teacher_profile_view.dart';
import '../modules/teacherlist/views/teacherlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LECTURE,
      page: () => const LectureView(),
      binding: LectureBinding(),
      children: [
        GetPage(
          name: _Paths.LECTURE_UPLOAD,
          page: () => const LectureUploadView(),
          binding: LectureUploadBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView(),
      binding: ResultBinding(),
      children: [
        GetPage(
          name: _Paths.RESULT_DETAILS,
          page: () => const ResultDetailsView(),
          binding: ResultDetailsBinding(),
        ),
        GetPage(
          name: _Paths.TEACHER_RESULT,
          page: () => const TeacherResultView(),
          binding: TeacherResultBinding(),
        ),
        GetPage(
          name: _Paths.TEACHER_ADD_RESULT,
          page: () => const TeacherAddResultView(),
          binding: TeacherAddResultBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.EXAM,
      page: () => const ExamView(),
      binding: ExamBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_EXAM,
          page: () => const AddExamView(),
          binding: AddExamBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.EXAM_DETAILS,
      page: () => const ExamDetailsView(),
      binding: ExamDetailsBinding(),
      children: [
        GetPage(
          name: _Paths.EXAM_DETAILS,
          page: () => const ExamDetailsView(),
          binding: ExamDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SUBJECT,
      page: () => const SubjectView(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: _Paths.HOME_WORK,
      page: () => const HomeWorkView(),
      binding: HomeWorkBinding(),
      children: [
        GetPage(
          name: _Paths.HOMEWORKDETAILS,
          page: () => const HomeworkDetailsView(),
          binding: HomeworkdetailsBinding(),
        ),
        GetPage(
          name: _Paths.ADD_HOME_WORK,
          page: () => const AddHomeWorkView(),
          binding: AddHomeWorkBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MAINPAGE,
      page: () => const MainPageView(),
      binding: MainpageBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
      children: [
        GetPage(
          name: _Paths.GROUPS,
          page: () => const GroupsView(),
          binding: GroupsBinding(),
          children: [
            GetPage(
              name: _Paths.GROUP_DETAILS,
              page: () => const GroupDetailsView(),
              binding: GroupDetailsBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.MESSAGES,
          page: () => const MessagesView(),
          binding: MessagesBinding(),
          children: [
            GetPage(
              name: _Paths.CHATS,
              page: () => ChatsView(),
              binding: ChatsBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.ASK_QUESTION,
          page: () => const AskQuestionView(),
          binding: AskQuestionBinding(),
        ),
        GetPage(
          name: _Paths.CHOOSE_PEOPLE,
          page: () => ChoosePeopleView(),
          binding: ChoosePeopleBinding(),
        ),
        GetPage(
          name: _Paths.CREATE_GROUP,
          page: () => const CreateGroupView(),
          binding: CreateGroupBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.COURSES,
      page: () => const CoursesView(),
      binding: CoursesBinding(),
      children: [
        GetPage(
          name: _Paths.COURSE_DETAILS,
          page: () => const CourseDetailsView(),
          binding: CourseDetailsBinding(),
        ),
        GetPage(
          name: _Paths.ALL_COURSES,
          page: () => const AllCoursesView(),
          binding: AllCoursesBinding(),
        ),
        GetPage(
          name: _Paths.ALL_CATEGORY_COURSES,
          page: () => const AllCategoryCoursesView(),
          binding: AllCategoryCoursesBinding(),
        ),
        GetPage(
          name: _Paths.ALL_TRENDING_COURSES,
          page: () => const AllTrendingCoursesView(),
          binding: AllTrendingCoursesBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE_DETAILS,
          page: () => const ProfileDetailsView(),
          binding: ProfileDetailsBinding(),
        ),
        GetPage(
          name: _Paths.PUBLIC_PROFILE,
          page: () => const PublicProfileView(),
          binding: PublicProfileBinding(),
        ),
        GetPage(
          name: _Paths.MY_ALL_COURSES,
          page: () => const MyAllCoursesView(),
          binding: MyAllCoursesBinding(),
        ),
        GetPage(
          name: _Paths.HELP_CENTER,
          page: () => const HelpCenterView(),
          binding: HelpCenterBinding(),
        ),
        GetPage(
          name: _Paths.PERSONAL_INFO,
          page: () => const PersonalInfoView(),
          binding: PersonalInfoBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
      children: [
        GetPage(
          name: _Paths.TIMER_QUIZ,
          page: () => const TimerQuizView(),
          binding: TimerQuizBinding(),
          children: [
            GetPage(
              name: _Paths.ANIMATE_QUIZ,
              page: () => const AnimateQuizView(),
              binding: AnimateQuizBinding(),
            ),
            GetPage(
              name: _Paths.SUMMARY,
              page: () => SummaryView(),
              binding: SummaryBinding(),
            ),
            GetPage(
              name: _Paths.QUS_ANS_REVIEW,
              page: () => QusAnsReviewView(),
              binding: QusAnsReviewBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.NORMAL_QUIZ,
          page: () => const NormalQuizView(),
          binding: NormalQuizBinding(),
        ),
        GetPage(
          name: _Paths.CATEGORIES_DETAILS,
          page: () => const CategoriesDetailsView(),
          binding: CategoriesDetailsBinding(),
        ),
        GetPage(
          name: _Paths.QUESTION_EXAM,
          page: () => const QuestionExamView(),
          binding: QuestionExamBinding(),
        ),
        GetPage(
          name: _Paths.QUIZMODE,
          page: () => const QuizModeView(),
          binding: QuizmodeBinding(),
        ),
        GetPage(
          name: _Paths.CHOOSE_CATEGORIES,
          page: () => ChooseCategoriesView(),
          binding: ChooseCategoriesBinding(),
        ),
        GetPage(
          name: _Paths.LEADER_BOAED,
          page: () => const LeaderBoardView(),
          binding: LeaderBoaedBinding(),
        ),
        GetPage(
          name: _Paths.LEADERBOARD,
          page: () => const LeaderboardView(),
          binding: LeaderboardBinding(),
        ),
        GetPage(
          name: _Paths.SINGLE_USER_QUIZ,
          page: () => const SingleUserQuizView(),
          binding: SingleUserQuizBinding(),
        ),
        GetPage(
          name: _Paths.MULTI_USER_QUIZ,
          page: () => const MultiUserQuizView(),
          binding: MultiUserQuizBinding(),
        ),
        GetPage(
          name: _Paths.JOIN_COMPETITION,
          page: () => const JoinCompetitionView(),
          binding: JoinCompetitionBinding(),
        ),
        GetPage(
          name: _Paths.PLAYER,
          page: () => const PlayerView(),
          binding: PlayerBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => const AttendanceView(),
      binding: AttendenceBinding(),
      children: [
        GetPage(
          name: _Paths.ATTENDANCETEACHER,
          page: () => const AttendanceteacherView(),
          binding: AttendanceteacherBinding(),
          children: [
            GetPage(
              name: _Paths.TEACHER_ATTENDANCE,
              page: () => const TeacherAttendanceView(),
              binding: TeacherAttendanceBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.ATTENDANCE_BOARD_CARDS,
          page: () => const AttendanceBoardCardsView(),
          binding: AttendanceBoardCardsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TEACHERLIST,
      page: () => const TeacherlistView(),
      binding: TeacherlistBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PROFILE,
      page: () => const TeacherProfileView(),
      binding: TeacherlistBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE,
      page: () => const NoticeView(),
      binding: NoticeBinding(),
      children: [
        GetPage(
          name: _Paths.NOTICE_DETAILS,
          page: () => const NoticeDetailsView(),
          binding: NoticeDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.FEES,
      page: () => const FeesView(),
      binding: FeesBinding(),
      children: [
        GetPage(
          name: _Paths.FEESDETAILS,
          page: () => const FeesDetails(),
          binding: FeesdetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.POST_FEED,
      page: () => const PostFeedView(),
      binding: PostFeedBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_LECTURE,
      page: () => VideoLecture(),
      binding: VideoLectureBinding(),
    ),
    GetPage(
      name: _Paths.ROUTINE,
      page: () => const RoutineView(),
      binding: RoutineBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_OPTION,
      page: () => const ChooseOptionView(),
      binding: ChooseOptionBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS,
      page: () => FriendsView(),
      binding: FriendsBinding(),
      children: [
        GetPage(
          name: _Paths.INVITE_FRIENDS,
          page: () => const InviteFriendsView(),
          binding: InviteFriendsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LEAVE_APPLICATION,
      page: () => const LeaveApplicationView(),
      binding: LeaveApplicationBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_LEAVE_APPLICATION,
          page: () => const AddLeaveApplicationView(),
          binding: AddLeaveApplicationBinding(),
        ),
        GetPage(
          name: _Paths.LEAVE_APPLICATION_DETAILS,
          page: () => const LeaveApplicationDetailsView(),
          binding: LeaveApplicationDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.COMPLAIN,
      page: () => const ComplainView(),
      binding: ComplainBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_COMPLAIN,
          page: () => const AddComplainView(),
          binding: AddComplainBinding(),
        ),
        GetPage(
          name: _Paths.COMPLAIN_DELAILS,
          page: () => const ComplainDetailsView(),
          binding: ComplainDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.INTRODUCTION_PAGE,
      page: () => const IntroductionPageView(),
      binding: IntroductionPageBinding(),
    ),
    GetPage(
      name: _Paths.ADMIT_CARD,
      page: () =>  AdmitCardView(),
      binding: AdmitCardBinding(),
    ),
    GetPage(
      name: _Paths.ID_CARD,
      page: () =>  IdCardView(),
      binding: IdCardBinding(),
    ),
  ];
}

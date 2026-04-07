class Friend {
  final String imageUrl;
  final String name;
  final String classes;
  final String group;

  Friend(
      {required this.imageUrl,
      required this.name,
      required this.classes,
      required this.group});

  static List<Friend> getUsers() {
    return [
      Friend(
        name: 'Rz Tutul',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/27/07/45/college-student-3500990_640.jpg',
        classes: '10',
        group: 'Science',
      ),
      Friend(
        name: 'Mainul Islam',
        imageUrl:
            'https://img.freepik.com/free-photo/front-view-male-student-wearing-black-backpack-holding-copybooks-files-blue-wall_140725-42636.jpg?size=626&ext=jpg&ga=GA1.1.1328086042.1707023822&semt=sph',
        classes: '10',
        group: 'Science',
      ),
      Friend(
        name: 'Jhon Doe.',
        imageUrl:
            'https://d2jyir0m79gs60.cloudfront.net/news/images/successful-college-student-lg.png',
        classes: '10',
        group: 'Science',
      ),
      Friend(
        name: 'Jaker Burz',
        imageUrl:
            'https://concept3d.com/wp-content/uploads/2023/08/Student-with-more-access-to-academic-resources-due-to-efforts-to-boost-student-retention-and-persistence.jpg',
        classes: '8',
        group: '',
      ),
      Friend(
        name: 'Jane Richie',
        imageUrl:
            'https://collegecountdown.scholarshare529.com/wp-content/uploads/2020/10/Smiling_AdobeStock_35308534.jpeg',
        classes: '8',
        group: '',
      ),
      Friend(
        name: 'Rodriguz',
        imageUrl:
            'https://img.freepik.com/free-photo/young-man-student-with-notebooks-showing-thumb-up-approval-smiling-satisfied-blue-studio-background_1258-65597.jpg?w=1060&t=st=1709700726~exp=1709701326~hmac=69772444ee24b8fd6998e6e01432607b3f1cb404bcf2e6906219c64257ac0707',
        classes: '7',
        group: '',
      ),
      Friend(
        name: 'Cris Jones',
        imageUrl:
            'https://img.freepik.com/free-photo/portrait-man-smiling-city_23-2150771187.jpg?t=st=1709700805~exp=1709704405~hmac=b63d65eb6465874e1fba8bf918eb66cf4865235bbb69d1229ae5a0f0fc195e0c&w=360',
        classes: '9',
        group: 'Commerce',
      ),
      Friend(
        name: 'Pratik Hasan',
        imageUrl:
            'https://img.freepik.com/premium-photo/young-asian-indian-student-with-glasses-backpack-holds-book-shows-thumbs-up_928503-89.jpg',
        classes: '9',
        group: 'Arts',
      ),
      Friend(
        name: 'Carl Edison',
        imageUrl:
            'https://img.freepik.com/premium-photo/teenager-student-girl-yellow-pointing-finger-side_1368-40175.jpg',
        classes: '9',
        group: 'Science',
      ),
      Friend(
        name: 'James Cameron',
        imageUrl:
            'https://st2.depositphotos.com/4431055/11868/i/950/depositphotos_118689478-stock-photo-young-college-student.jpg',
        classes: '9',
        group: 'Commerce',
      ),
      Friend(
        name: 'Blake Watts',
        imageUrl:
            'https://cdn7.dissolve.com/p/D430_49_999/D430_49_999_1200.jpg',
        classes: '9',
        group: 'Arts',
      ),
      Friend(
        name: 'Jessie Pinkman',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXGbzhfkOZSzlTnIOIc-ZnpgBVe_ufbyq7y6rmL6tVfEateJCa9oXVG8vm7rWrzA73ZHE&usqp=CAU',
        classes: '9',
        group: 'Sciecne',
      ),
    ];
  }
}

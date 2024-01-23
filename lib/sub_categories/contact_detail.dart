class ContactDetail {
  final String name;
  final String phoneNumber;
  final String email;
  final String img;
  final String description;
  final String qualification;

  ContactDetail({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.img,
    required this.description,
    required this.qualification,
  });
}

final List<ContactDetail> dietitians = [
  ContactDetail(
    name: 'Dr Waseem',
    phoneNumber: '+92 313 5486947',
    email: 'ginnastichealthcare@gmail.com',
    img: 'assets/images/dr_waseem.jpg',
    description:
        "Doctor Waseem Ullah Shaheen is the founder of a health and fitness center. He plays a very important role in highlighting the concept of physical health and fitness in the people of Pakistan. He himself is a medical doctor and works on the treatment of different diseases with exercise and not with medicine. The major theme is to treat disease by lifestyle modification and changes in diet plan",
    qualification:
        "Dr. Wasem Ullah Shaheen completed his MBBS from the renowned medical college of Pakistan. He also got online certification in nutrition and fitness.",
  ),
  ContactDetail(
    name: 'Shehar Bano',
    phoneNumber: '0415068065',
    email: 'shehar.bano12@gmail.com',
    img: "assets/images/shehar.jpg",
    description:
        "Ms. Shehar Bano is a Dietitian with 2 years of experience. You can book an in-person appointment or an online video consultation with Ms. Shehar Bano through meal match or by calling at 0415068065.",
    qualification: "B.S. Human Nutrition and Dietetics.",
  ),
  ContactDetail(
    name: 'Mr. Haseeb Ahmed',
    phoneNumber: '0518151800',
    email: 'haseebahmad312@gmail.com',
    img: "assets/images/haseeb.jpg",
    description:
        "Ms. Shehar Bano is a Dietitian with 2 years of experience. You can book an in-person appointment or an online video consultation with Ms. Shehar Bano through meal match or by calling at 0415068065.",
    qualification: "B.Sc (Hons) Human Nutrition and Dietetics.",
  ),
  ContactDetail(
      name: 'Mr. Shahnam Ul Hassan',
      phoneNumber: '0415068065',
      email: 'haseebahmad312@gmail.com',
      img: "assets/images/shahnam.jpg",
      description:
          'Mr. Shahnam Ul Hassan is a Dietitian with 2 years of experience. You can book an in-person appointment or an online video consultation with Mr. Shahnam Ul Hassan through oladoc.com or by calling at 0415068065. ',
      qualification: "B.S. Human Nutrition and Dietetics."),
  ContactDetail(
      name: 'Mr. Talha Hafeez',
      phoneNumber: '0415068065',
      email: 'haseebahmad312@gmail.com',
      img: "assets/images/talha.jpg",
      description:
          'Mr. Talha Hafeez is a Nutritionist with 2 years of experience. You can call our helpline 0415068065 for more information. ',
      qualification: "B.Sc (Hons) Human Nutrition and Dietetics"),
  ContactDetail(
      name: 'Ms. Shoa Kainat',
      phoneNumber: '0415068065',
      email: 'haseebahmad312@gmail.com',
      img: "assets/images/shao.jpg",
      description:
          'Ms. Shoa Kainat is a Dietitian with 2 years of experience. You can book an in-person appointment or an online video consultation with Ms. Shoa Kainat through by calling at 0415068065. ',
      qualification: "BS (Human Nutrition & Dietetics)"),

];



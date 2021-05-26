class InternshipModel {
  final String companyName;
  final String jobDescription;
  final String image;
  final bool isfromHome;
  final String internSalary;
  final String jobSalary;
  final int duration;
  final bool isFullTime;
  final DateTime deadline;

  InternshipModel(
      {this.companyName,
      this.jobDescription,
      this.image,
      this.isfromHome,
      this.internSalary,
      this.jobSalary,
      this.duration,
      this.isFullTime,
      this.deadline});
}

package PackagePerson.PackageStudent;

import PackagePerson.Person;
import java.util.Scanner;

public class Student extends Person {
    protected int rollNo;
    protected int subjectCount;
    protected String[] subjects;

    public Student(String name, int age, int rollNo, int subjectCount) {
        super(name, age);
        this.rollNo = rollNo;
        this.subjectCount = subjectCount;
        subjects = new String[this.subjectCount];

        for (int i = 0; i < subjectCount; i++) {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter subject name for subject " + (i + 1) + " ==> ");
            subjects[i] = scanner.nextLine();
        }
    }

    public void displayStudentData() {

        System.out.println("Name ==> " + name);
        System.out.println("Age ==> " + age);
        System.out.println("Rno ==> " + rollNo);
        System.out.println("Subject ==> " + subjectCount);

        for (String subject : subjects) {
            System.out.println("----->" + subject);
        }
    }

    public void displayStudentData(boolean showSubject) {
        System.out.println("Name ==> " + name);
        System.out.println("Age ==> " + age);
        System.out.println("Rno ==> " + rollNo);
        System.out.println("Subject ==> " + subjectCount);
    }
}

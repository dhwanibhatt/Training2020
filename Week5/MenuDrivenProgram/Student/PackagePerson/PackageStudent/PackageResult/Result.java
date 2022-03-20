package PackagePerson.PackageStudent.PackageResult;

import PackagePerson.PackageStudent.Student;
import java.util.Scanner;

public class Result extends Student {
    private int[] marks;
    private int totalMarks;
    private int percentage;
    private double percentile;

    public Result(String name, int age, int rollNo, int subjectCount) {
        super(name, age, rollNo, subjectCount);
        marks = new int[subjectCount];
        totalMarks = 0;

        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < subjectCount; i++) {
            System.out.print("Enter marks for " + subjects[i] + ": ");
            marks[i] = scanner.nextInt();
            totalMarks += marks[i];
        }
        percentage = (totalMarks * 100) / (100 * subjectCount);
    }

    private static Result[] sortResultsByPercentage(Result[] mResultList) {
        int n = mResultList.length;
        Result temp;
        for(int i=0; i < n; i++) {
            for (int j = 1; j < (n - i); j++) {
                if (mResultList[j - 1].percentage < mResultList[j].percentage) {
                    temp = mResultList[j - 1];
                    mResultList[j - 1] = mResultList[j];
                    mResultList[j] = temp;
                }

            }
        }
        return mResultList;
    }

    public static void displayTopThree(Result[] mResultList) {
        mResultList = sortResultsByPercentage(mResultList);

        for (Result result : mResultList) {
            result.displayResultInfo();
        }
    }

    public static void displayAccPercentile(Result[] mResultList) {
        mResultList = sortResultsByPercentage(mResultList);

        for (int i = 0; i < mResultList.length; i++) {
            double totalPeople = mResultList.length;
            double numBehindPeople = totalPeople - i;
            mResultList[i].percentile = (numBehindPeople / totalPeople) * 100;
        }

        for (Result result : mResultList) {
            result.displayResultInfo(true);
        }
    }

    public void displayResultInfo() {
        displayStudentData(false);

        System.out.println("Subjects");
        for (int i = 0; i < subjectCount; i++) {
            System.out.println(subjects[i] + " ==> " + marks[i]);
        }

        System.out.println("Percentage ==> " + percentage);
    }

    public void displayResultInfo(boolean displayPercentile) {
        displayStudentData(false);

        System.out.println("Subjects");
        for (int i = 0; i < subjectCount; i++) {
            System.out.println(subjects[i] + " ==> " + marks[i]);
        }

        System.out.println("Percentage ==> " + percentage);
        System.out.println("Percentile ==> " + percentile);
    }
}

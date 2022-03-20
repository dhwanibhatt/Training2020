import PackagePerson.PackageStudent.PackageResult.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Result[] mResultList;


        try{
            System.out.println("");
            Scanner scanner = new Scanner(System.in);
            System.out.print("No of students ==> ");
            int studentNum = scanner.nextInt();
            mResultList = new Result[studentNum];
    
            for (int i = 0; i < studentNum; i++) {
                Scanner scannerForString = new Scanner(System.in);
                System.out.print("Name ==> ");
                String name = scannerForString.nextLine();
    
                System.out.print("Age ==> ");
                int age = scanner.nextInt();
    
                System.out.print("Roll no ==> ");
                int rollNo = scanner.nextInt();
    
                System.out.print("No of Opted subjects ==> ");
                int subjectCount = scanner.nextInt();
    
                mResultList[i] = new Result(name, age, rollNo, subjectCount);
            }
    
            Result.displayTopThree(mResultList);
            Result.displayAccPercentile(mResultList);
        }
        catch (Exception e) {
            
        }

    }
}

import EmployeePackage.*;
public class Main {
    public static void main(String[] args) {

        System.out.println("");
        Employee employee = new Employee(101, 50000, "Dhwani");
        System.out.println("Employee salary ==> " + employee.calculateSalary());

        Employee programmer = new Programmer(201, 30000, "ABC", 5000);
        System.out.println("Programmer salary ==> " + programmer.calculateSalary());

        Employee manager = new Manager(301, 70000, "XYZ", 5000, 1000);
        System.out.println("Manager salary ==> " + manager.calculateSalary());
    }
}

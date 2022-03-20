package EmployeePackage;

public class Employee {
    int employeeId, basicSalary;
    String name;

    public Employee(int employeeId, int basicSalary, String name) {
        this.employeeId = employeeId;
        this.basicSalary = basicSalary;
        this.name = name;
    }

    public int calculateSalary() {
        return basicSalary;
    }
}



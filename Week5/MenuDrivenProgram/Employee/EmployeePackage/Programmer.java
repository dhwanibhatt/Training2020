package EmployeePackage;

public class Programmer extends Employee {
    int commission;

    public Programmer(int employeeId, int basicSalary, String name, int commission) {
        super(employeeId, basicSalary, name);
        this.commission = commission;
    }

    @Override
    public int calculateSalary() {
        return (basicSalary + commission);
    }
}

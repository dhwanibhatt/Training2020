package EmployeePackage;

public class Manager extends Programmer {
    int dearnessAllowance;

    public Manager(int employeeId, int basicSalary, String name, int commission, int dearnessAllowance) {
        super(employeeId, basicSalary, name, commission);
        this.dearnessAllowance = dearnessAllowance;
    }

    @Override
    public int calculateSalary() {
        return (basicSalary + commission + dearnessAllowance);
    }
}

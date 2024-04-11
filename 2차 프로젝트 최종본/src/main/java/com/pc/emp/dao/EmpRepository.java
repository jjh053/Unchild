package com.pc.emp.dao;

import java.util.List;

import com.pc.emp.dto.Account;
import com.pc.emp.dto.Employee;

public interface EmpRepository {
    Account findByUserId(String userId);
    public List<Employee> getEmpList(Employee employee);
    public List<Account> getAccountList();
    
    // 메서드 추가 가능
}

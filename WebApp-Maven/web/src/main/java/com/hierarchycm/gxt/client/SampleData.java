package com.hierarchycm.gxt.client;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.extjs.gxt.ui.client.data.BaseModel;
import com.google.gwt.i18n.client.DateTimeFormat;


public class SampleData {
	public static class Employee extends BaseModel {  
		private static final long serialVersionUID = 1L;  
		  
		public Employee() {  
		}  
		public Employee(String name, String department, String designation,double salary, Date joiningdate) {  
		set("name", name);  
		set("department", department);  
		set("designation", designation);  
		set("salary", salary);  
		set("joiningdate", joiningdate);  
		}  
		public Date getJoiningdate() {  
		return (Date) get("joiningdate");  
		}  
		public String getName() {  
		return (String) get("name");  
		}  
		public String getDepartment() {  
		return (String) get("department");  
		}  
		public String getDesignation() {  
		return (String) get("designation");  
		}  
		public double getSalary() {  
		Double salary = (Double) get("salary");  
		return salary.doubleValue();  
		}  
		public String toString() {  
		return getName();  
		}
	} 
	
	public static List<Employee> getEmployees()  
	{  
	  List<Employee> employees = new ArrayList<Employee>();  
	  DateTimeFormat f = DateTimeFormat.getFormat("yyyy-mm-dd");  
	  employees.add(new Employee("Hollie Voss","General Administration","Executive Director",150000,f.parse("2006-05-01")));  
	  employees.add(new Employee("Emerson Milton","Information Technology","CTO",12000,f.parse("2007-03-01")));  
	  employees.add(new Employee("Christina Blake","Information Technology","Project Manager",90000,f.parse("2008-08-01")));  
	  employees.add(new Employee("Heriberto Rush","Information Technology","Senior S/W Engineer",70000,f.parse("2009-02-07")));  
	  employees.add(new Employee("Candice Carson","Information Technology","S/W Engineer",60000,f.parse("2007-11-01")));  
	  employees.add(new Employee("Chad Andrews","Information Technology","Senior S/W Engineer",70000,f.parse("2008-02-01")));  
	  employees.add(new Employee("Dirk Newman","Information Technology","S/W Engineer"  ,62000,f.parse("2009-03-01")));  
	  employees.add(new Employee("Bell Snedden","Information Technology","S/W Engineer",73000,f.parse("2007-07-07")));  
	  employees.add(new Employee("Benito Meeks","Marketing","General Manager",105000,f.parse("2008-02-01")));  
	  employees.add(new Employee("Gail Horton","Marketing","Executive",55000,f.parse("2009-05-01")));  
	  employees.add(new Employee("Claudio Engle","Marketing","Executive",58000,f.parse  ("2008-09-03")));  
	  employees.add(new Employee("Buster misjenou","Accounts","Executive",52000,f.parse("2008-02-07")));  
	  
	  return employees;  
	}
}

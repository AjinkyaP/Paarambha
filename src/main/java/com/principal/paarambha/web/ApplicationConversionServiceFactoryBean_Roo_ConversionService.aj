// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.principal.paarambha.web;

import com.principal.paarambha.domain.Employee;
import com.principal.paarambha.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Employee, String> ApplicationConversionServiceFactoryBean.getEmployeeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.principal.paarambha.domain.Employee, java.lang.String>() {
            public String convert(Employee employee) {
                return new StringBuilder().append(employee.getFirstName()).append(' ').append(employee.getLastName()).append(' ').append(employee.getEmailId()).append(' ').append(employee.getDateOfBirth()).toString();
            }
        };
    }
    
    public Converter<Long, Employee> ApplicationConversionServiceFactoryBean.getIdToEmployeeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.principal.paarambha.domain.Employee>() {
            public com.principal.paarambha.domain.Employee convert(java.lang.Long id) {
                return Employee.findEmployee(id);
            }
        };
    }
    
    public Converter<String, Employee> ApplicationConversionServiceFactoryBean.getStringToEmployeeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.principal.paarambha.domain.Employee>() {
            public com.principal.paarambha.domain.Employee convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Employee.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getEmployeeToStringConverter());
        registry.addConverter(getIdToEmployeeConverter());
        registry.addConverter(getStringToEmployeeConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}

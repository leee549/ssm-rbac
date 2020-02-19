package cn.lhx.entity;

import lombok.*;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class Employee {

    private Long id;
    private String name;
    private String password;
    private String email;
    private int age;
    private Boolean admin;
    private long deptId;
    private Department dept;
    private List<Role> roles;

}

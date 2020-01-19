package cn.lhx.utils.page;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryObject {

    /*分页相关*/
    private int currentPage=1;
    private int pagesize=5;

    /*封装高级查询条件*/
    private String keyword;
    private Long deptId;

}

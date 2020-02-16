package cn.lhx.base;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author lee549
 * @date 2020/2/15 21:50
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AjaxResult<T> {
    //判断返回成功还是失败
    private Boolean ret;

    // 比如我用ajax 请求查询学生集合，这时候，查到的 List 就是这个T，泛型
    private T data;

    // msg 一般是给失败的放失败的原因，成功不会用到
    private String msg;

    /**
     * 成功
     *
     * @return
     */
    public static AjaxResult success() {

        return AjaxResult.builder().ret(true).data(null).build();

    }

    /**
     * 成功带数据
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> AjaxResult success(T data) {
        return AjaxResult.builder().ret(true).data(data).build();

    }

    public static <T> AjaxResult error() {
        return AjaxResult.builder().ret(false).build();

    }

    public static <T> AjaxResult error(String msg) {
        return AjaxResult.builder().ret(false).msg(msg).build();
    }

}

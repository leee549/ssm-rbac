package cn.lhx.utils;

import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * @author chachae
 * @date 2019/12/3 10:16
 */
public class Md5Util {

  /**
   * 密码加密
   *
   * @param password 明文密码
   * @return 密文
   */
  public static String encode(String password) {
    // 加密方式
    String algorithmName = "MD5";
    // 加密的字符串，加密的次数,可以进行多次的加密操作
    int hashIterations = 10000;
    // 通过SimpleHash 来进行加密操作
    SimpleHash hash = new SimpleHash(algorithmName, password, null, hashIterations);
    return hash.toString();
  }



}

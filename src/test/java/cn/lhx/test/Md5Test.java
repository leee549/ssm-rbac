package cn.lhx.test;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.Sha256Hash;

import java.util.UUID;

/**
 * @author lee549
 * @date 2020/2/11 14:40
 */
public class Md5Test {
    public static void main(String[] args) {
        String pwd = "1";
        String id = "1";
        String s = new Md5Hash(id,pwd,10000).toString();
        System.out.println(s);


//        String salt2 = UUID.randomUUID().toString();
//        String s3 =new Sha256Hash(pwd,salt2,10000).toBase64();
//        String s4 =new Sha256Hash(pwd,salt2,10000).toString();
//        System.out.println(s3);
//        System.out.println(s4);

    }
}

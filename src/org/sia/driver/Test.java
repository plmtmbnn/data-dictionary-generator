/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.driver;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Polma E. Tambunan
 */
public class Test {
    public static void main(String[] args) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(timestamp);
        double fl;
        fl = 1234567.987654321;
        System.out.println(fl);
        String st = "BP-DDiak-04-01";
        String cb[] = st.split("BP-");
        System.out.println(cb[1]);
                Map<Integer, Integer> listIdDD = new HashMap<>();
                listIdDD.put(23,23);
                if (listIdDD.get(2) == null) {
                    System.out.println("null");
        }else
                {
                    System.out.println("ada");
                }

    }
}

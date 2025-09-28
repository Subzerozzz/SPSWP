/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.utils;

import java.util.Random;

/**
 *
 * @author ADMIN
 */
public class GlobalUtils {

    public static int generateOTP(int length) {
        Random rand = new Random();
        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < length; i++) {
            otp.append(rand.nextInt(10));
        }

        return Integer.parseInt(otp.toString());
    }

}
    
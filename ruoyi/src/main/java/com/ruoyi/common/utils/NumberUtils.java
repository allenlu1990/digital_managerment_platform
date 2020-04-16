package com.ruoyi.common.utils;

public class NumberUtils {
  public static int changeLevelToNumber(String result) {
    switch (result) {
      case "A+":
        return 100;
      case "A":
        return 95;
      case "A-":
        return 90;
      case "B+":
        return 85;
      case "B":
        return 80;
      case "B-":
        return 75;
      case "C+":
        return 70;
      case "C":
        return 65;
      case "C-":
        return 60;
      case "D+":
        return 55;
      case "D":
        return 50;
      case "D-":
        return 40;
      default:
        return 100;
    }
  }

  public static  String changeNumberToLevel(int number) {
    if (number > 95) {
      return "A+";
    }
    if (number > 90 && number <= 95) {
      return "A";
    }
    if (number > 85 && number <= 90) {
      return "A-";
    }
    if (number > 80 && number <= 85) {
      return "B+";
    }
    if (number > 75 && number <= 80) {
      return "B";
    }
    if (number > 70 && number <= 75) {
      return "B-";
    }
    if (number > 65 && number <=70) {
      return "C+";
    }
    if (number > 60 && number <= 65) {
      return "C";
    }
    if (number > 55 && number <= 60) {
      return "C-";
    }
    if (number > 50 && number <= 55) {
      return "D+";
    }
    if (number > 45 && number <= 50) {
      return "D";
    }else {
      return "D-";
    }
  }

}

package com.example.buoi2;

public class City {
    private int cityCode;
    private String cityName;
    private String numberDist;

    public City(int cityCode, String cityName, String numberDist) {
        this.cityCode = cityCode;
        this.cityName = cityName;
        this.numberDist = numberDist;
    }

    // Getters and setters
    public int getCityCode() {
        return cityCode;
    }

    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getNumberDist() {
        return numberDist;
    }

    public void setNumberDist(String numberDist) {
        this.numberDist = numberDist;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Younes
 */
public class CarriersDTO {
    private int id;
    private String code;
    private String name;
    private String imageUrlCarriers;

    public CarriersDTO(int id, String code, String name, String imageUrlCarriers) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.imageUrlCarriers = imageUrlCarriers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrlCarrier() {
        return imageUrlCarriers;
    }

    public void setImageUrl(String imageUrlCarriers) {
        this.imageUrlCarriers = imageUrlCarriers;
    }
    
    
    
    
}

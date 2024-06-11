package vn.chinh.pizzahut.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Name cannot be empty")
    private String name;
    @NotNull(message = "price cannot be empty")
    private double price;
    @NotNull(message = "quantity cannot be empty")
    private int quantity;
    private String category;

    private String image;
    @NotEmpty(message = "detailDesc cannot be empty")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;
    private int sold;

    @ManyToOne
    @JoinColumn(name = "combo_id")
    private Combo combo;

    public Product(long id, String category, String image, String name, double price, int quantity,
            String detailDesc,
            int sold) {
        this.id = id;
        this.category = category;
        this.image = image;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.detailDesc = detailDesc;
        this.sold = sold;
    }

    public Product() {
        // TODO Auto-generated constructor stub
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public Combo getCombo() {
        return combo;
    }

    public void setCombo(Combo combo) {
        this.combo = combo;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}

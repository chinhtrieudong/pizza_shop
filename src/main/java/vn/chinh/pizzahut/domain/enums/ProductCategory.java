package vn.chinh.pizzahut.domain.enums;

public enum ProductCategory {
    PIZZA("Pizza"),
    APPETIZER("appetizer"),
    DRINK("Drink"),
    CHICKEN("Chicken"),
    MY_BOX("myBox");

    private String value;

    ProductCategory(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}

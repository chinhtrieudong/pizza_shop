package vn.chinh.pizzahut.domain.enums;

public enum OrderStatus {
    PENDING("Pending", "Đang chờ xử lý"),
    PROCESSING("Processing", "Đang xử lý"),
    SHIPPED("Shipped", "Đã giao hàng"),
    CANCELLED("Cancelled", "Đã hủy");

    private final String english;
    private final String vietnamese;

    OrderStatus(String english, String vietnamese) {
        this.english = english;
        this.vietnamese = vietnamese;
    }

    public String getEnglish() {
        return english;
    }

    public String getVietnamese() {
        return vietnamese;
    }
}

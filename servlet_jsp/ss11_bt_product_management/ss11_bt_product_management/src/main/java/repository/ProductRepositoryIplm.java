package repository;

import model.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryIplm implements IProductRepository {
    private static List<Products> productsList = new ArrayList<>();

    static {
        productsList.add(new Products(1, "Bút bi", 4500, "Xanh dương", "Thiên Long"));
        productsList.add(new Products(2, "Bút mực", 7000, "Xanh lá", "Thiên Long"));
        productsList.add(new Products(3, "Thước kẻ", 4500, "Xanh dương", "Thiên Long"));
        productsList.add(new Products(4, "Compa", 4500, "Nâu", "Thiên Long"));
    }

    @Override
    public List<Products> getAll() {
        return productsList;
    }

    @Override
    public void save(Products products) {
        productsList.add(products);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productsList.size(); i++) {
            if(id == productsList.get(i).getId()){
                productsList.remove(i);
                break;
            }
        }
    }

    @Override
    public void edit(int id, Products products) {
        for (int i = 0; i < productsList.size(); i++) {
            if(id == productsList.get(i).getId()){
                productsList.set(i,products);
                break;
            }
        }
    }

}

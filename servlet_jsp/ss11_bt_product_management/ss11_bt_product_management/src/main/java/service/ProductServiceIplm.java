package service;

import model.Products;
import repository.IProductRepository;
import repository.ProductRepositoryIplm;

import java.util.List;

public class ProductServiceIplm implements IProductService {
    private IProductRepository productRepository = new ProductRepositoryIplm();

    @Override
    public List<Products> findAll() {
        List<Products> productsList = productRepository.getAll();
        if (productsList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productsList;
    }

    @Override
    public void save(Products products) {
        productRepository.save(products);
    }

    @Override
    public void remove(int id) {
        productRepository.delete(id);
    }

    @Override
    public void update(int id, Products products) {
        List<Products> productsList = productRepository.getAll();
        for (int i = 0; i < productsList.size(); i++) {
            if(id == productsList.get(i).getId()){

            }
        }
    }


    @Override
    public Products showById(int id) {
        return null;
    }

    @Override
    public Products findByName(String name) {
        return null;
    }
}

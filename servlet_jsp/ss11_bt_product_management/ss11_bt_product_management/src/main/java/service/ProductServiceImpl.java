package service;

import model.Products;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    private IProductRepository productRepository = new ProductRepositoryImpl();

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
        productRepository.edit(id, products);
    }
}

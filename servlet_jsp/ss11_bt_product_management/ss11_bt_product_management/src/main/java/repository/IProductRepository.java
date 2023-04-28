package repository;

import model.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> getAll();

    void save(Products products);

    void delete(int id);

}

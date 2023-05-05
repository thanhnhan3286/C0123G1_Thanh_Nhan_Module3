package service;

import model.Products;

import java.util.List;

public interface IProductService {
    List<Products> findAll();

    void save(Products customer);

    void update(int id, Products customer);

    void remove(int id);
}

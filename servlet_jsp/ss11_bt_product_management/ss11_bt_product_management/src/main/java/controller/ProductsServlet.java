package controller;

import model.Products;
import service.IProductService;
import service.ProductServiceIplm;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {

    private IProductService productService = new ProductServiceIplm();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            }
            case "delete":{
                delete(request, response);
                break;
            }
            case "edit":{
                edit(request, response);
                break;

            }
            default: {
                showList(request, response);

            }
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Products> productsList = productService.findAll();
        for (int i = 0; i < productsList.size(); i++) {
            if(id == productsList.get(i).getId()){
                request.setAttribute("id",productsList.get(i).getId());
                request.setAttribute("name",productsList.get(i).getName());
                request.setAttribute("price",productsList.get(i).getPrice());
                request.setAttribute("description",productsList.get(i).getDescription());
                request.setAttribute("producer",productsList.get(i).getProducer());
                request.getRequestDispatcher("/edit.jsp").forward(request, response);
            }
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        response.sendRedirect("/products");
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> productsList = productService.findAll();
        if (productsList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        }else {
            request.setAttribute("productsList",productsList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":{
                create(request, response);
                break;
            }
            case "edit":{
                List<Products> productsList = productService.findAll();
                Integer id = Integer.valueOf(request.getParameter("id"));
                String name = request.getParameter("name");
                Double price = Double.valueOf(request.getParameter("price"));
                String description = request.getParameter("description");
                String producer = request.getParameter("producer");
                Products products = new Products(id,name,price,description,producer);
                productService.update(id, products);
                response.sendRedirect("/products");
            }
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Products products = new Products(id,name,price,description,producer);
        productService.save(products);
        response.sendRedirect("/products");
    }
}

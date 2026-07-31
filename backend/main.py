from fastapi import FastAPI
app = FastAPI(title="Product Api")
product=[{
        "id": 1,
        "name": "iPhone 16 Pro",
        "price": 1299.99,
        "image": "https://itechstore.co.in/uploads/products/16-pro-pdp-1.jpg",
        "description": "Latest Apple smartphone."
    },
    {
        "id": 2,
        "name": "Gaming Laptop",
        "price": 1599.99,
        "image": "https://images.jdmagicbox.com/quickquotes/images_main/asus-rog-strix-hero-gaming-laptop-gl504-15-6-144hz-ips-type-slim-display-intel-core-i7-8750h-processor-up-to-3-9ghz-113434402-8iqea.jpg",
        "description": "RTX 4070 Gaming Laptop"
    },
    {
        "id": 3,
        "name": "Wireless Headphones",
        "price": 149.99,
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BEts5j-X3yT0Bqw9zuKS9PtVxJIB2vZEWWj2kdngUQ&s=10",
        "description": "Noise Cancelling Headphones"
    }]
@app.get("/")
def home():
    return {"message": "Shop Api ir live"}
@app.get("/products")
def get_products():
    return product
@app.get("/products/{product_id}")
def get_product(product_id: int):
    for p in product:
        if p["id"] == product_id:
            return p
    return {"error": "Product not found"}
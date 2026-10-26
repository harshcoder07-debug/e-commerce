
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Product API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

products = [
    {
        "id": 1,
        "name": "iPhone 16 Pro",
        "price": 1299.99,
        "category": "Phones",
        "image": "https://itechstore.co.in/uploads/products/16-pro-pdp-1.jpg",
        "description": "The iPhone 16 Pro combines a durable titanium design with the powerful A18 Pro chip, a stunning 6.3-inch Super Retina XDR display, and an advanced 48MP Pro camera system. Built for exceptional performance, professional photography, and all-day battery life, it delivers Apple's most premium smartphone experience."
    },
    {
        "id": 2,
        "name": "Gaming Laptop",
        "price": 1599.99,
        "category": "Laptop",
        "image": "https://images.jdmagicbox.com/quickquotes/images_main/asus-rog-strix-hero-gaming-laptop-gl504-15-6-144hz-ips-type-slim-display-intel-core-i7-8750h-processor-up-to-3-9ghz-113434402-8iqea.jpg",
        "description": "Maximum Thermal Control: Keeps your high-end CPU and GPU running cool to eliminate FPS drops and thermal throttling. Pro-Grade Ergonomics: Elevates your screen to eye level to reduce neck strain during marathon gaming sessions. Heavy-Duty Stability: Built from rugged materials to securely support heavy 15.6 to 17.3 inch gaming rigs."
    },
    {
        "id": 3,
        "name": "Wireless Headphones",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BEts5j-X3yT0Bqw9zuKS9PtVxJIB2vZEWWj2kdngUQ&s=10",
        "description": "Immersive Spatial Audio with noise-canceling microphone, comfortable memory foam earcups, multi-platform connectivity, and low-latency wireless audio."
    },
    {
        "id": 4,
        "name": "Samsung S24",
        "price": 1299.99,
        "category": "Phones",
        "image": "https://files.refurbed.com/ii/samsung-galaxy-s24-1705560065.jpg",
        "description": "The Samsung Galaxy S24 is a premium, compact flagship smartphone with high-end performance, mobile AI innovation, and a streamlined design."
    },
    {
        "id": 5,
        "name": "Macbook",
        "price": 1599.99,
        "category": "Laptop",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsthQsnPU6yjwM4PLL1U9oXmady4g9vk_Z9IB2A5rZEg&s=10",
        "description": "Apple premium laptop line, known for its sleek aluminum design, exceptional battery life, and powerful Apple Silicon processors."
    },
    {
        "id": 6,
        "name": "Wireless Mouse",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://cdn.shopify.com/s/files/1/0015/6932/5091/files/wireless-bluetooth-mouse-for-laptop-rechargeable-mouse-2-4g-usb-optical-wireless-mouse-led-slim-dual-mode-bluetooth-5-0-and-2-4g-wireless-mouse-for-laptop-pc-894.webp",
        "description": "Premium wireless mouse with ergonomic design, silent clicks, and dual-mode connectivity."
    },
    {
        "id": 7,
        "name": "Earbuds",
        "price": 1299.99,
        "category": "Electronic",
        "image": "https://www.boat-lifestyle.com/cdn/shop/files/Main_Image_95795bed-492f-48e4-8f61-40138334b8a4.png?v=1767007119",
        "description": "Wireless earbuds designed for convenient everyday listening."
    },
    {
        "id": 8,
        "name": "Shirt",
        "price": 1599.99,
        "category": "Clothing",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSib__yaUqfzT15NczHSfLTzC--r5wQVgAvTG8Hm6G0GA&s=10",
        "description": "Comfortable everyday shirt with a modern style."
    },
    {
        "id": 9,
        "name": "Shoes Men",
        "price": 149.99,
        "category": "Shoes",
        "image": "https://plaeto.in/cdn/shop/files/1_353aad53-b809-446e-9386-89e1dae6374b.jpg?v=1754980288&width=5000",
        "description": "Men's shoes designed for everyday comfort and casual wear."
    },
    {
        "id": 10,
        "name": "Keyboard Gaming",
        "price": 1299.99,
        "category": "Gaming",
        "image": "https://kreo-tech.com/cdn/shop/files/ZDDGZDFZDHDH.png?v=1781185245",
        "description": "Gaming keyboard designed for responsive input and comfortable gameplay."
    },
    {
        "id": 11,
        "name": "External ssd",
        "price": 1599.99,
        "category": "Electronics",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUcxhaf8UfLRuuhXTvEN0k0OBCkHHHj58y4FNgPCRp9toFINphfiP7r4&s=10",
        "description": "External SSD for storing and transferring your files."
    },
    {
        "id": 12,
        "name": "PowerBank",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://erdshop.com/cdn/shop/files/PB-130PowerBankBlack-2.webp?v=1779690340",
        "description": "Portable power bank for convenient charging on the go."
    }
]


# Home API
@app.get("/")
def home():
    return {"message": "Product API is running"}


# Get all products
@app.get("/products")
def get_products():
    return products


# Get product by ID
@app.get("/products/{product_id}")
def get_product_by_id(product_id: int):
    for product in products:
        if product["id"] == product_id:
            return product

   


# Get products by category
@app.get("/category/{category}")
def get_products_by_category(category: str):
    result = [
        product for product in products
        if product["category"].lower() == category.lower()
    ]

   


# Get all available categories
@app.get("/categories")
def get_categories():
    return {
        "categories": sorted(set(
            product["category"] for product in products
        ))
    }

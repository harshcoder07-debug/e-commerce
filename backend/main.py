from fastapi import FastAPI
app = FastAPI(title="Product Api")
from fastapi.middleware.cors import CORSMiddleware
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
        "category": "laptop",
        "image": "https://images.jdmagicbox.com/quickquotes/images_main/asus-rog-strix-hero-gaming-laptop-gl504-15-6-144hz-ips-type-slim-display-intel-core-i7-8750h-processor-up-to-3-9ghz-113434402-8iqea.jpg",
        "description": "Maximum Thermal Control: Keeps your high-end CPU and GPU running cool to eliminate FPS drops and thermal throttling. Pro-Grade Ergonomics: Elevates your screen to eye level to reduce neck strain during marathon gaming sessions. Heavy-Duty Stability: Built from rugged materials to securely support heavy 15.6\" to 17.3\" gaming rigs without shaking. Seamless Connectivity: Integrated ports expand your setup instantly for mice, keyboards, and external storage. Gaming Aesthetic: Sleek, modern design that integrates perfectly with your existing RGB setup."
    },
    {
        "id": 3,
        "name": "Wireless Headphones",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BEts5j-X3yT0Bqw9zuKS9PtVxJIB2vZEWWj2kdngUQ&s=10",
        "description": "Immersive Spatial Audio: Tuned drivers deliver 360-degree positional sound so you can hear every footstep, reload, and environmental cue. Crystal-Clear Communication: Broadcast-grade, noise-canceling microphone filters out background noise for flawless team callouts. Pro-Marathon Comfort: Ultra-soft memory foam earcups and a lightweight, suspension headband eliminate clamping pressure during long sessions. Universal Multi-Platform Fit: Seamlessly plugs into or pairs with PC, PlayStation 5, Xbox Series X|S, Nintendo Switch, and mobile devices. Lag-Free Connection: Experience zero audio delay with high-speed connections designed for competitive, fast-paced gameplay."
    },


    {
        "id": 4,
        "name": "Samsung S24",
        "price": 1299.99,
        "category": "Phones",
        "image": "https://files.refurbed.com/ii/samsung-galaxy-s24-1705560065.jpg",
        "description": "The Samsung Galaxy S24 is a premium, compact flagship smartphone that prioritises high-end performance, mobile AI innovation, and a streamlined, comfortable design."
    },
    {
        "id": 5,
        "name": "Macbook",
        "price": 1599.99,
        "category": "laptop",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsthQsnPU6yjwM4PLL1U9oXmady4g9vk_Z9IB2A5rZEg&s=10",
        "description": "The MacBook is Apple premium line of laptop computers, globally recognized for its sleek aluminum design, exceptional battery life, and powerful custom Apple Silicon processors."
    },
    {
        "id": 6,
        "name": "Wireless Mouse",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://cdn.shopify.com/s/files/1/0015/6932/5091/files/wireless-bluetooth-mouse-for-laptop-rechargeable-mouse-2-4g-usb-optical-wireless-mouse-led-slim-dual-mode-bluetooth-5-0-and-2-4g-wireless-mouse-for-laptop-pc-894.webp",
        "description": "Premium Wireless Mouse  Ergononic, Silent-Click, Dual-Mode"
    },
      {
        "id": 7,
        "name": "Earbuds",
        "price": 1299.99,
        "category": "Electronic",
        "image": "https://www.boat-lifestyle.com/cdn/shop/files/Main_Image_95795bed-492f-48e4-8f61-40138334b8a4.png?v=1767007119",
        "description": "The iPhone 16 Pro combines a durable titanium design with the powerful A18 Pro chip, a stunning 6.3-inch Super Retina XDR display, and an advanced 48MP Pro camera system. Built for exceptional performance, professional photography, and all-day battery life, it delivers Apple's most premium smartphone experience."
        },
        {
        "id": 8,
        "name": "Shirt",
        "price": 1599.99,
        "category": "Clothing",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSib__yaUqfzT15NczHSfLTzC--r5wQVgAvTG8Hm6G0GA&s=10",
        "description": "Maximum Thermal Control: Keeps your high-end CPU and GPU running cool to eliminate FPS drops and thermal throttling. Pro-Grade Ergonomics: Elevates your screen to eye level to reduce neck strain during marathon gaming sessions. Heavy-Duty Stability: Built from rugged materials to securely support heavy 15.6\" to 17.3\" gaming rigs without shaking. Seamless Connectivity: Integrated ports expand your setup instantly for mice, keyboards, and external storage. Gaming Aesthetic: Sleek, modern design that integrates perfectly with your existing RGB setup."
        },
        {
        "id": 9,
        "name": "Shoes Men",
        "price": 149.99,
        "category": "Shoes",
        "image": "https://plaeto.in/cdn/shop/files/1_353aad53-b809-446e-9386-89e1dae6374b.jpg?v=1754980288&width=5000",
        "description": "Immersive Spatial Audio: Tuned drivers deliver 360-degree positional sound so you can hear every footstep, reload, and environmental cue. Crystal-Clear Communication: Broadcast-grade, noise-canceling microphone filters out background noise for flawless team callouts. Pro-Marathon Comfort: Ultra-soft memory foam earcups and a lightweight, suspension headband eliminate clamping pressure during long sessions. Universal Multi-Platform Fit: Seamlessly plugs into or pairs with PC, PlayStation 5, Xbox Series X|S, Nintendo Switch, and mobile devices. Lag-Free Connection: Experience zero audio delay with high-speed connections designed for competitive, fast-paced gameplay."
        },
    
    
        {
        "id": 10,
        "name": "Keyboard Gaming",
        "price": 1299.99,
        "category": "Gaming",
        "image": "https://kreo-tech.com/cdn/shop/files/ZDDGZDFZDHDH.png?v=1781185245",
        "description": "The Samsung Galaxy S24 is a premium, compact flagship smartphone that prioritises high-end performance, mobile AI innovation, and a streamlined, comfortable design."
        },
        {
        "id": 11,
        "name": "External ssd",
        "price": 1599.99,
        "category": "Electronics",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUcxhaf8UfLRuuhXTvEN0k0OBCkHHHj58y4FNgPCRp9toFINphfiP7r4&s=10",
        "description": "The MacBook is Apple premium line of laptop computers, globally recognized for its sleek aluminum design, exceptional battery life, and powerful custom Apple Silicon processors."
        },
        {
        "id": 12,
        "name": "PowerBank",
        "price": 149.99,
        "category": "Electronics",
        "image": "https://erdshop.com/cdn/shop/files/PB-130PowerBankBlack-2.webp?v=1779690340",
        "description": "Premium Wireless Mouse  Ergononic, Silent-Click, Dual-Mode"
        },
]
    

@app.get("/")
def home():
    return {"message": "Shop Api is live"}
@app.get("/products")
def get_products(category: str = "All Categories"):
    if category == "All Categories":
        return products

    return [
        p for p in products
        if p["category"] == category
    ]
@app.get("/products/{product_id}")
def get_product(product_id: int):
    for p in products:
        if p["id"] == product_id:
            return p
    return {"error": "Product not found"}
app.add_middleware(CORSMiddleware,allow_methods=["*"],allow_origins=["*"])

DATABASE =[ 
    {"name": "Oversized Beige Blazer", "category": "Minimalist Fashion"},
    {"name": "White Cotton Tee", "category": "Minimalist Fashion"},
    {"name": "90s Denim Jacket", "category": "Vintage"},
    {"name": "Graphic Skate Hoodie", "category": "Streetwear"},
    ]

# //function for sending request to Api 
@app.get("/productCatecogires")
def get_data():
    return {
        "categories":["All Categories","Electronics","Phones","Clothing","Shoes","Laptop","Gaming"],
        "products":DATABASE
    }
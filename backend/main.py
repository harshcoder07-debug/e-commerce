from fastapi import FastAPI
app = FastAPI(title="Product Api")
products = [
    {
        "id": 1,
        "name": "iPhone 16 Pro",
        "price": 1299.99,
        "image": "https://itechstore.co.in/uploads/products/16-pro-pdp-1.jpg",
        "description": "The iPhone 16 Pro combines a durable titanium design with the powerful A18 Pro chip, a stunning 6.3-inch Super Retina XDR display, and an advanced 48MP Pro camera system. Built for exceptional performance, professional photography, and all-day battery life, it delivers Apple's most premium smartphone experience."
    },
    {
        "id": 2,
        "name": "Gaming Laptop",
        "price": 1599.99,
        "image": "https://images.jdmagicbox.com/quickquotes/images_main/asus-rog-strix-hero-gaming-laptop-gl504-15-6-144hz-ips-type-slim-display-intel-core-i7-8750h-processor-up-to-3-9ghz-113434402-8iqea.jpg",
        "description": "Maximum Thermal Control: Keeps your high-end CPU and GPU running cool to eliminate FPS drops and thermal throttling. Pro-Grade Ergonomics: Elevates your screen to eye level to reduce neck strain during marathon gaming sessions. Heavy-Duty Stability: Built from rugged materials to securely support heavy 15.6\" to 17.3\" gaming rigs without shaking. Seamless Connectivity: Integrated ports expand your setup instantly for mice, keyboards, and external storage. Gaming Aesthetic: Sleek, modern design that integrates perfectly with your existing RGB setup."
    },
    {
        "id": 3,
        "name": "Wireless Headphones",
        "price": 149.99,
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BEts5j-X3yT0Bqw9zuKS9PtVxJIB2vZEWWj2kdngUQ&s=10",
        "description": "Immersive Spatial Audio: Tuned drivers deliver 360-degree positional sound so you can hear every footstep, reload, and environmental cue. Crystal-Clear Communication: Broadcast-grade, noise-canceling microphone filters out background noise for flawless team callouts. Pro-Marathon Comfort: Ultra-soft memory foam earcups and a lightweight, suspension headband eliminate clamping pressure during long sessions. Universal Multi-Platform Fit: Seamlessly plugs into or pairs with PC, PlayStation 5, Xbox Series X|S, Nintendo Switch, and mobile devices. Lag-Free Connection: Experience zero audio delay with high-speed connections designed for competitive, fast-paced gameplay."
    }
    ,

    {
        "id": 4,
        "name": "Samsung S24",
        "price": 1299.99,
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2vNt6sg5OHIAwPpmlXsbyXunnsj6U8QjmbHZRrdnjc8aKXxlYt2SFRobj&s=10",
        "description": "The Samsung Galaxy S24 is a premium, compact flagship smartphone that prioritises high-end performance, mobile AI innovation, and a streamlined, comfortable design."
    },
    {
        "id": 5,
        "name": "Macbook",
        "price": 1599.99,
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsthQsnPU6yjwM4PLL1U9oXmady4g9vk_Z9IB2A5rZEg&s=10",
        "description": "The MacBook is Apple premium line of laptop computers, globally recognized for its sleek aluminum design, exceptional battery life, and powerful custom Apple Silicon processors."
    },
    {
        "id": 6,
        "name": "Wireless Mouse",
        "price": 149.99,
        "image": "https://cdn.shopify.com/s/files/1/0015/6932/5091/files/wireless-bluetooth-mouse-for-laptop-rechargeable-mouse-2-4g-usb-optical-wireless-mouse-led-slim-dual-mode-bluetooth-5-0-and-2-4g-wireless-mouse-for-laptop-pc-894.webp",
        "description": "Premium Wireless Mouse  Ergononic, Silent-Click, Dual-Mode"
    }
]
    

@app.get("/")
def home():
    return {"message": "Shop Api is live"}
@app.get("/products")
def get_products():
    return products
@app.get("/products/{product_id}")
def get_product(product_id: int):
    for p in products:
        if p["id"] == product_id:
            return p
    return {"error": "Product not found"}
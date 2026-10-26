
from fastapi import APIRouter, Depends, HTTPException
from firebase import verify_firebase_token

router = APIRouter(
    prefix="/products",
    tags=["products"],
    dependencies=[Depends(verify_firebase_token)]
)

# Keep your existing products list here


@router.get("/categories")
def get_categories():
    return {
        "categories": [
            "All Categories",
            "Electronics",
            "Phones",
            "Clothing",
            "Laptop",
            "Gaming",
            "Shoes",
            "Electronic"
        ]
    }


@router.get("")
def get_products(category: str = "All categories"):
    if category.strip().lower() == "all categories":
        return products

    return [
        p for p in products
        if p["category"].strip().lower() == category.strip().lower()
    ]


@router.get("/{product_id}")
def get_product_by_id(product_id: int):
    for p in products:
        if p["id"] == product_id:
            return p

    raise HTTPException(
        status_code=404,
        detail="Product not found"
    )
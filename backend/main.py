from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from product import router as product_router
app = FastAPI(title="data api")
app.add_middleware(
    CORSMiddleware,
    allow_origins=[""],
    allow_methods=[""],
    allow_headers=[""]
)
@app.get("/")
def home():
    return {"message":"Api live "}
app.include_router(product_router)
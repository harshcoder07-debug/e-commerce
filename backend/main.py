
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from product import router as product_router

app = FastAPI(title="Data API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://localhost:5173",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def home():
    return {"message": "API live"}


app.include_router(product_router)

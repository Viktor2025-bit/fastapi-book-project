from fastapi import APIRouter
from api.endpoints.books import router as books_router  

api_router = APIRouter()
api_router.include_router(books_router, prefix="/books", tags=["Books"])

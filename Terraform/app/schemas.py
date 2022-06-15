from typing import Optional, Dict, List, Set
from pydantic import BaseModel, Field, HttpUrl # for request body interactions



# Product ------------------------------------------------
class ProductBase(BaseModel):
    name: str = Field(None, title="The name of the product", max_length=100, example="iogurte")                              
    description: Optional[str] = Field(None, title="The description of the product", max_length=300, example="iogurte desnatado 200g")   
    brand: Optional[str] = Field(None, title="The brand of the item", max_length=80, example="nestle")   
    price: float = Field(..., gt=0, description="The price must be greater than zero", example=2.7)
    discount: Optional[float] = Field(..., ge=0, lt=1, description="The discount must be greater than 0 and less than 1", example=0.05)     
    quantity: float = Field(..., gt=0, description="The quantity must be greater than zero", example=1)
    url_img: Optional[str] = Field(..., description="The url of the product img", example="www.someproductimage.com")

class ProductCreate(ProductBase):
    pass

class ProductUpdate(ProductBase):
    name: str                             
    description: Optional[str]  
    brand: Optional[str]   
    price: float 
    discount: Optional[float]      
    quantity: float 
    url_img: Optional[str] 



class Product(ProductBase):
    id_product: int

    class Config:
        orm_mode = True


# Cart ---------------------------------------------------
class CartBase(BaseModel):
    id_user: int

class CartUpdate(CartBase):
    id_user: int

class CartCreate(CartBase):
    pass

class Cart(CartBase):
    id_cart: int
    products: Set[str] = set() # lista de produtos unicos

    class Config:
        orm_mode = True

# CartProduct ---------------------------------------------------

class CartProductBase(BaseModel):
    id_cart: int
    id_product: int
    quantity: int

class CartProductUpdate(CartProductBase):
    id_cart: int
    id_product: int
    quantity: int

class CartProductCreate(CartProductBase):
    pass

class CartProduct(CartProductBase):
    id_cart: int
    id_product: int

    class Config:
        orm_mode = True
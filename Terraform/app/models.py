from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, Float
from .database import Base
from sqlalchemy.orm import relationship



# Product ----------------------------------------------------
class Product(Base):
    __tablename__ = "Product"

    id_product = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    description = Column(String)
    brand = Column(String)
    price = Column(Float, nullable=False)
    discount = Column(Float)
    quantity = Column(Integer, nullable=False)
    url_img = Column(String)

    # Relationships
    products_inventory = relationship("CartProduct", back_populates="products_cart")

# Cart ---------------------------------------------------
class Cart(Base):
    __tablename__ = "Cart"

    id_cart = Column(Integer, primary_key=True, index=True)
    id_user = Column(Integer,  index=True)

    # Relationships
    carts = relationship("CartProduct", back_populates="cart")
    
# CartProduct --------------------------------------------
class CartProduct(Base):
    __tablename__ = "CartProduct"

    id_cart = Column(Integer, ForeignKey("Cart.id_cart"), primary_key=True, index=True)
    cart = relationship("Cart", back_populates="carts")
    
    id_product = Column(Integer, ForeignKey("Product.id_product"), primary_key=True, index=True)
    products_cart = relationship("Product", back_populates="products_inventory")
    
    quantity = Column(Integer, nullable=False)
    
    


# class User(Base):
#     __tablename__ = "users"

#     id = Column(Integer, primary_key=True, index=True)
#     email = Column(String, unique=True, index=True)
#     hashed_password = Column(String)
#     is_active = Column(Boolean, default=True)

#     items = relationship("Item", back_populates="owner")


# class Item(Base):
#     __tablename__ = "items"

#     id = Column(Integer, primary_key=True, index=True)
#     title = Column(String, index=True)
#     description = Column(String, index=True)
#     owner_id = Column(Integer, ForeignKey("users.id"))

#     owner = relationship("User", back_populates="items")


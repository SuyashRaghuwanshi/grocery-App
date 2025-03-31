import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/api/api_service.dart';
import 'package:flutter_node_grocery_app/application/state/cart_state.dart';
import 'package:flutter_node_grocery_app/models/cart_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIService _apiService;

  CartNotifier(this._apiService) : super(const CartState()) {
    getCartItem();
  }
  Future<void> getCartItem() async {
    state = state.copyWith(isLoading: true);

    final cartData = await _apiService.getCart();

    state = state.copyWith(cartModel: cartData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItem(productId, qty) async {
    await _apiService.addCartItem(productId, qty);

    await getCartItem();
  }

  Future<void> removeCartItem(productId, qty) async {
    await _apiService.removeCartItem(productId, qty);

    var isCartItemExist = state.cartModel!.products.firstWhere(
      (element) => element.product.productId == productId,
    );
    var updatedItems = state.cartModel!;
    updatedItems.products.remove(isCartItemExist);
    state = state.copyWith(cartModel: updatedItems);
  }

  Future<void> updateQty(productId, qty, type) async {
    var cartItem = state.cartModel!.products.firstWhere(
      (element) => element.product.productId == productId,
    );
    var updatedItems = state.cartModel!;

    if (type == "-") {
      await _apiService.removeCartItem(productId, 1);

      if (cartItem.qty > 1) {
        CartProduct cartProduct = CartProduct(
          qty: cartItem.qty,
          product: cartItem.product,
        );
        updatedItems.products.remove(cartItem);
        updatedItems.products.add(cartProduct);
      } else {
        updatedItems.products.remove(cartItem);
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      CartProduct cartProduct = CartProduct(
        qty: cartItem.qty + 1,
        product: cartItem.product,
      );
      updatedItems.products.remove(cartItem);
      updatedItems.products.add(cartProduct);
    }
    state = state.copyWith(cartModel: updatedItems);
  }
}

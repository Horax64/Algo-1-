from queue import Queue

def procesamiento_pedidos(pedidos,stock_productos,precios_productos):
    pedidos_procesados = []
    while not(pedidos.empty()):
        precio_pedido = 0 
        pedido_actual = pedidos.get()
        lista_cosas = pedido_actual['productos']
        for producto in lista_cosas:
             if stock_productos[producto] != 0:
                 precio_pedido += lista_cosas[producto]*precios_productos[producto]
                 stock_productos[producto] = stock_productos[producto] - lista_cosas[producto]
             else:
                lista_cosas[producto] = 0
        pedido_actual['productos'] = lista_cosas
        pedido_actual['precio_total'] = precio_pedido
        for compra in lista_cosas:
            if lista_cosas[compra] == 0:
                pedido_actual['estado'] = 'incompleto'
        pedido_actual['estado'] = 'completo'
        pedidos_procesados.append(pedido_actual)
    return pedidos_procesados

stock_productos = { ”Manzana”: 10, ”Leche”: 5, ”Pan”: 3, ”Factura”: 0 }

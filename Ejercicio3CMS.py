from queue import Queue

def procesamiento_pedidos(pedidos,stock_productos,precios_productos):
    pedidos_procesados = []
    while not(pedidos.empty()):
        precio_pedido = 0 
        pedido_actual = pedidos.get()
        lista_cosas = pedido_actual['productos']
        cosas_a_entregar = {}
        for item in lista_cosas:
            cosas_a_entregar[item] = 0
        for producto in lista_cosas:
             if stock_productos[producto] != 0:
                 while stock_productos[producto] > 0 and cosas_a_entregar[producto] < lista_cosas[producto]:
                    precio_pedido += precios_productos[producto]
                    stock_productos[producto] = stock_productos[producto] - 1 
                    cosas_a_entregar[producto] += 1 
        pedido_actual['precio_total'] = precio_pedido
        for cosa in cosas_a_entregar:
            if cosas_a_entregar[cosa] == 0 or cosas_a_entregar[cosa] < pedido_actual['productos'][cosa]:
                pedido_actual['estado'] = 'incompleto'
            else:
                pedido_actual['estado'] = 'completo'
        pedido_actual['productos'] = cosas_a_entregar
        pedidos_procesados.append(pedido_actual)
    return pedidos_procesados

stock_productos1 = { 'Manzana': 10, 'Leche': 5, 'Pan': 3, 'Factura': 0 }
precio_productos1 = { 'Manzana': 3.5, 'Leche': 5.5, 'Pan': 3.5, 'Factura': 2.75 }
pedidos1 = Queue() 
pedidos1.put({'id': 21,'cliente': 'Gabriela','productos': {'Manzana': 2}}) 
pedidos1.put({'id': 1,'cliente': 'Juan','productos': {'Manzana': 2, 'Pan': 4, 'Factura': 6}})

print(procesamiento_pedidos(pedidos1,stock_productos1,precio_productos1))
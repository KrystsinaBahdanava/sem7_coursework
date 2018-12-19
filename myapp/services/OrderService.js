const db = require('../db')
const CartService = require('./CartService')

const OrderService = {

    placeOrder(sessionId, form) {
        return new Promise((resolve, reject) => {

            CartService.getItems(sessionId).then(items => {
                if (!items.length) {
                    throw new Error('No items in cart')
                }

                let total = items.reduce(function (acc, item) {
                    return acc + (item.quantity * item.price)
                }, 0)

                // Create order itself
                db.query('INSERT INTO orders (session_id, `name`, phone, email, address, total_price) VALUES (:sessionId, :name, :phone, :email, :address, :total)', {
                    sessionId,
                    total: total,
                    name: form.name,
                    phone: form.phone,
                    email: form.email,
                    address: form.address,
                }, function (error, results) {
                    if (error) {
                        reject(error)
                        return
                    }

                    let orderId = parseInt(results.insertId)

                    if (!orderId) {
                        throw new Error('Missing order ID')
                    }

                    // Create order items
                    let values = ''

                    items.forEach(item => {
                        values += `(${orderId}, ${item.product_id}, ${item.quantity}),`
                    })

                    values = values.substring(0, values.length - 1) // remove last coma

                    let query = `INSERT INTO order_items (order_id, product_id, quantity) VALUES ${values}`

                    db.query(query, {}, function (error, results) {
                        if (error) {
                            reject(error)
                            return
                        }

                        // Delete cart items.
                        CartService.emptyCart(sessionId).then(() => {
                            resolve()
                        }).catch(cartError => {
                            console.error('Unable to clear cart: ', cartError)

                            resolve()
                        })
                    })
                })
            }).catch(error => {
                reject(error)
            })
        })
    },


}

module.exports = OrderService
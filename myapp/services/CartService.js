const db = require('../db')

const CartService = {
    getItems(sessionId) {
        let query = `
          SELECT 
            ci.product_id,
            ci.quantity, 
            rd.image,
            rd.price, 
            rd.name, 
            rd.description,
            r.name as restaurant_name
          FROM 
            cart_items ci
          LEFT JOIN restaurant_dishes rd
            ON (rd.id = ci.product_id)
          LEFT JOIN restaurants r
            ON (r.id = rd.restaurant_id)
          WHERE 
            session_id = :session_id`

        return new Promise((resolve, reject) => {
            db.query(query, {session_id: sessionId}, function (error, items) {
                error ? reject(error) : resolve(items)
            })
        })
    },

    updateItem(sessionId, itemId, quantity) {
        let query = `INSERT INTO cart_items (session_id, product_id, quantity) VALUES (:session_id, :item_id, :quantity) ON DUPLICATE KEY UPDATE quantity = :quantity`

        return new Promise((resolve, reject) => {
            db.query(query, {
                item_id: itemId,
                session_id: sessionId,
                quantity: quantity || 1
            }, function (error, results) {
                error ? reject(error) : resolve(results.affectedRows)
            })
        })
    },

    deleteItem(sessionId, itemId) {
        let query = `DELETE FROM cart_items WHERE session_id = :session_id AND product_id = :item_id`

        return new Promise((resolve, reject) => {
            db.query(query, {
                item_id: itemId,
                session_id: sessionId,
            }, function (error, results) {
                error ? reject(error) : resolve(results.affectedRows)
            })
        })
    },

    emptyCart(sessionId) {
        let query = `DELETE FROM cart_items WHERE session_id = :session_id`

        return new Promise((resolve, reject) => {
            db.query(query, {session_id: sessionId}, function (error, results) {
                error ? reject(error) : resolve(results.affectedRows)
            })
        })
    }
}

module.exports = CartService
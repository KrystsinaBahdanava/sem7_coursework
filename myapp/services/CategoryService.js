const db = require('../db')

module.exports = {
    getCategories() {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM `categories`', {}, function (error, items) {
                error ? reject(error) : resolve(items)
            })
        })
    },

    findCategory(id) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM `categories` WHERE `id` = :id', {id}, function (error, items) {
                (error || !items || !items.length) ? reject(error || 'Not found') : resolve(items[0])
            })
        })
    }
}
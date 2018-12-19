const db = require('../db')

const perPage = 20

const RestaurantService = {
    getQuery(params, forCount = false) {
        let fields = forCount ? 'COUNT(r.id) as count' : 'r.*, c.title as category'
        let whereString = 'WHERE is_active = 1 '

        if (params.search) {
            params.search = `%${params.search}%`
            whereString += `AND name LIKE ${db.escape(params.search)} `
        }

        if (params.category_id) {
            whereString += `AND category_id = :category_id `
        }

        if ((params.price_from && !isNaN(parseInt(params.price_from))) || (params.price_to && !isNaN(parseInt(params.price_to)))) {
            let subQuery

            if (params.price_from && params.price_to) {
                subQuery = `BETWEEN ${parseInt(params.price_from)} AND ${parseInt(params.price_to)}`
            } else {
                subQuery = params.price_from ? `> ${parseInt(params.price_from)}` : `< ${parseInt(params.price_to)}`
            }

            whereString += `AND EXISTS (
                SELECT 1 FROM restaurant_dishes WHERE restaurant_dishes.restaurant_id = r.id AND restaurant_dishes.price ${subQuery}
            ) `
        }

        if (params.page && !forCount) {
            let offset = parseInt((params.page - 1) * perPage)
            whereString += `LIMIT ${perPage} OFFSET ${offset} `
        }

        return `
            SELECT 
              ${fields}
            FROM 
              restaurants r
            LEFT JOIN 
              categories c ON (c.id = r.category_id)
              ${whereString}
            `
    },


    getAllRestaurants(params) {
        let countPromise = new Promise((resolve, reject) => {
            let query = this.getQuery(params, true)

            db.query(query, params, function (error, results) {
                error ? reject(error) : resolve(results && results.length ? results[0].count : 0)
            })
        })

        return countPromise.then(count => {
            let data = {
                pages: 0,
                perPage,
                total: count,
                items: [],
            }

            data.pages = Math.ceil(count / perPage)

            return new Promise((resolve, reject) => {
                let query = this.getQuery(params, false)

                db.query(query, params, function (error, results) {
                    data.items = results ? results : []

                    error ? reject(error) : resolve(data)
                })
            })
        })
    },

    findById(id) {
        let queryRestaurant = `SELECT r.*, c.title as category FROM restaurants r LEFT JOIN categories c ON (c.id = r.category_id) WHERE r.id = :id`
        let queryDishes = `SELECT * FROM restaurant_dishes rd WHERE rd.restaurant_id = :id`
        let queryFeedbacks = `SELECT * FROM restaurant_feedbacks rf WHERE rf.restaurant_id = :id ORDER BY created_at DESC`

        let basePromise = new Promise((resolve, reject) => {
            db.query(queryRestaurant, {id}, function (error, results) {
                error ? reject(error) : results.length ? resolve(results[0]) : reject()
            })
        })

        let dishesPromise = new Promise((resolve, reject) => {
            db.query(queryDishes, {id}, function (error, results) {
                error ? reject(error) : resolve(results)
            })
        })

        let feedbacksPromise = new Promise((resolve, reject) => {
            db.query(queryFeedbacks, {id}, function (error, results) {
                error ? reject(error) : resolve(results)
            })
        })

        return Promise.all([basePromise, dishesPromise, feedbacksPromise]).then(values => {
            let restaurant = values[0]
            restaurant.dishes = values[1]
            restaurant.feedbacks = values[2]

            return restaurant
        })
    },

    addFeedback(id, form) {
        let query = `INSERT INTO restaurant_feedbacks (restaurant_id, first_name, rate, comment) VALUES (:id, :first_name, :rate, :comment)`

        return new Promise((resolve, reject) => {
            db.query(query, {
                id: id,
                rate: form.rate,
                comment: form.comment,
                first_name: form.name
            }, function (error, results) {
                let rateQuery = `
                    UPDATE 
                      restaurants r    
                    LEFT JOIN (
                      SELECT 
                        rfinner.restaurant_id, AVG(rfinner.rate) as avgrate
                      FROM 
                        restaurant_feedbacks rfinner 
                      GROUP BY
                        rfinner.restaurant_id
                    ) rf ON (rf.restaurant_id = r.id)
                    SET
                      r.average_rating = rf.avgrate
                    WHERE 
                      r.id = :id
                `

                // Update average rating for given restaurant.
                db.query(rateQuery, {id: id}, function (_error, _results) {
                    if (_error) console.error(_error)
                    error ? reject(error) : resolve(results.affectedRows)
                })
            })
        })
    }
}

module.exports = RestaurantService

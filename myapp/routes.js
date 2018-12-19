const express = require('express')
const router = express.Router()

const CartService = require('./services/CartService')
const OrderService = require('./services/OrderService')
const CategoryService = require('./services/CategoryService')
const RestaurantService = require('./services/RestaurantService')

// ----------------------------
// Static page routes
// ----------------------------

router.get('/', (req, res) => {
    res.render('homepage.twig')
})

router.get('/order', (req, res) => {
    res.render('order.twig')
})

router.get('/news', (req, res) => {
    res.render('news.twig')
})

router.get('/contacts', (req, res) => {
    res.render('contacts.twig')
})

router.get('/cart', (req, res) => {
    res.render('cart.twig')
})

router.get('/restaurant/:id', (req, res) => {
    RestaurantService.findById(req.params.id).then(restaurant => {
        res.render('restaurant.twig', {restaurant})
    }).catch(error => {
        console.error('Restaurant error: ', error)

        res.sendStatus(404)
    })
})

router.post('/restaurant/:id', function (req, res) {
    RestaurantService.addFeedback(req.params.id, req.body).then(() => {
        res.redirect('back')
    }).catch(error => {
        res.sendStatus(500)
        console.error(error)
    })
})

// ----------------------------
// API routes - categories
// ----------------------------

router.get('/api/categories', function (req, res) {
    CategoryService.getCategories().then(items => res.json(items))
})

router.get('/category/:id', (req, res) => {
    CategoryService.findCategory(req.params.id).then(category => {
        res.render('category.twig', {category})
    }).catch(error => {
        console.error('Category not found: ', error)

        res.sendStatus(404)
    })
})

// ----------------------------
// API routes - restaurants
// ----------------------------

router.get('/api/restaurants', function (req, res) {
    RestaurantService.getAllRestaurants(req.query).then(items => {
        res.json(items)
    }).catch(error => {
        console.error('Unable to get restaurants:', error)

        res.json([])
    })
})

// ----------------------------
// API routes - cart
// ----------------------------

router.get('/api/cart', (req, res) => {
    CartService.getItems(req.session.id).then(items => {
        res.json(items)
    }).catch(error => {
        console.error(error)
        res.json([])
    })
})

router.post('/api/cart/:id', (req, res) => {
    CartService.updateItem(req.session.id, req.params.id, req.body.quantity).then(() => {
        res.json({
            status: 'success'
        })
    })
})

router.delete('/api/cart/:id', (req, res) => {
    CartService.deleteItem(req.session.id, req.params.id).then(() => {
        res.json({
            status: 'success'
        })
    })
})


// ----------------------------
// API routes - place order
// ----------------------------

router.post('/api/order', (req, res) => {
    OrderService.placeOrder(req.session.id, req.body).then(() => {
        res.json({
            status: 'success'
        })
    }).catch(error => {
        console.error('Unable to create an order: ', error)

        res.status(500).json({
            message: error.message
        })
    })
})

module.exports = router
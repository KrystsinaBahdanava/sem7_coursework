new Vue({
    el: '#app',

    components: {
        'order-form': orderForm
    },

    data: {
        categories: [],

        restaurants: {
            items: [],
            pages: 0,
            total: 0,
            perPage: 0,
        },

        restaurantFilters: {
            page: 1,
            search: null,
            price_from: null,
            price_to: null
        },

        restaurantCommentForm: {
            name: '',
            comment: '',
            rate: null
        },

        cartItems: []
    },

    created: function () {
        if (foodPanda && foodPanda.isHomepage) {
            this.getCategories()
            this.getRestaurants()
        }

        this.getCartItems()
    },

    mounted: function() {
        $("#slider-holder ul").jcarousel({
            // scroll: 1,
            // auto: 6,
            // wrap: 'both',
            //initCallback: _init_slider,
            //itemFirstInCallback: _active_slide,
            //buttonNextHTML: null,
            //buttonPrevHTML: null
        });
    },

    computed: {
        totalCartItems: function () {
            return this.cartItems.reduce(function (acc, item) {
                return acc + item.quantity
            }, 0)
        },

        totalCartSum: function () {
            return this.cartItems.reduce(function (acc, item) {
                return acc + (item.quantity * item.price)
            }, 0).toFixed(2)
        },

        canLeaveComment: function () {
            return this.restaurantCommentForm.name.trim().length && this.restaurantCommentForm.rate
        }
    },

    methods: {
        getCategories: function () {
            axios.get('/api/categories').then(function (response) {
                this.categories = response.data
            }.bind(this)).catch(function (error) {
                console.error(error)
            })
        },

        getRestaurants: function () {
            axios.get('/api/restaurants', {
                params: this.restaurantFilters
            }).then(function (response) {
                this.restaurants = response.data
            }.bind(this)).catch(function (error) {
                console.error(error)
            })
        },

        getCartItems() {
            axios.get('/api/cart').then(function (response) {
                this.cartItems = response.data
            }.bind(this)).catch(function (error) {
                console.error(error)
            })
        },

        filterRestaurants: function (filter, value) {
            if (filter !== 'page') {
                this.restaurantFilters.page = 1
            }

            this.restaurantFilters[filter] = value
            this.getRestaurants()
        },

        searchRestaurants: function () {
            this.restaurantFilters.page = 1
            this.$nextTick(this.getRestaurants)
        },

        isInCart: function (id) {
            var inCart = false

            $.each(this.cartItems, function (index, item) {
                if (parseInt(id) === item.product_id) {
                    inCart = true
                }
            })

            return inCart
        },

        addToCart: function (id, quantity = 1) {
            axios.post('/api/cart/' + id, {quantity: quantity}).then(function () {
                this.getCartItems()
            }.bind(this)).catch(function (error) {
                console.error(error)
                alert('Неизвестная ошибка')
            })
        },

        removeFromCart: function (id) {
            axios.delete('/api/cart/' + id).then(function () {
                this.getCartItems()
            }.bind(this)).catch(function (error) {
                console.error(error)
                alert('Неизвестная ошибка')
            })
        },

        placeOrder: function () {
            console.log('asd')
        }
    }
})
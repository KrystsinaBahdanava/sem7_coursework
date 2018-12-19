var orderForm = {
    data: function () {
        return {
            form: {
                name: '',
                phone: '',
                email: '',
                address: ''
            },

            success: false,
            error: false
        }
    },

    computed: {
        canSubmitForm: function () {
            if (!this.form.name || this.form.name.trim().length < 3) {
                return false
            }

            if (!this.form.phone || this.form.phone.trim().length < 8) {
                return false
            }

            if (!this.form.address || this.form.address.trim().length < 3) {
                return false
            }

            return true
        }
    },

    methods: {
        placeOrder: function () {
            var self = this

            self.error = false
            self.success = false

            axios.post('/api/order', this.form).then(function(response) {
                self.success = true
                self.resetForm()
                self.$root.getCartItems()
            }).catch(function (error) {
                self.error = error.response.data.message
            })
        },

        resetForm: function () {
            this.form.name = ''
            this.form.phone = ''
            this.form.email = ''
            this.form.address = ''
        }
    }
}
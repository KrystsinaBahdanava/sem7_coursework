const path = require('path')
const logger = require('morgan')
const routes = require('./routes')
const express = require('express')
const session = require('express-session')
const cookieParser = require('cookie-parser')

const app = express()
const port = 3030

app.use(cookieParser())

app.use(session({
    resave: false,
    saveUninitialized: true,
    secret: 'kVrcDSFlL4pBFHgY3EWX'
}))

app.use(logger('dev'))
app.use(express.json())

app.use(express.urlencoded({
    extended: false
}))

app.use(routes)

app.use(express.static(path.join(__dirname, 'public')))

app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something broke!')
})

app.use((req, res, next) => {
    res.status(404).send('Sorry can\'t find that!')
})

app.disable('etag')

app.listen(port)
console.log('Running @ Port: ' + port)

module.exports = app
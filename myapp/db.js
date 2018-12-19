const mysql = require('mysql')
const config = require('./config')

const connection = mysql.createConnection(config.db)

// Use PDO style query statements.
connection.config.queryFormat = function (query, values) {
    if (!values) return query

    return query.replace(/\:(\w+)/g, function (text, key) {
        if (values.hasOwnProperty(key)) {
            return this.escape(values[key])
        }

        return text
    }.bind(this))
}

connection.connect(function (err) {
    if (err) throw err
})

module.exports = connection
fs = require("fs")
appPath = process.cwd()
mongoose = require('node-odata').mongoose
User = mongoose.model("User")

initData = (model, path) ->
  require(appPath + path).forEach (item) ->
    data = new model(item)
    data.save()
    console.log "data init: #{path} import successful."

module.exports = ->
  User.find().exec (err, users) ->
    unless users.length
      initData(mongoose.model("User"), "/bootstrap/test-data/system/user.json")
      initData(mongoose.model("Article"), "/bootstrap/test-data/article/article.json")
      initData(mongoose.model("Category"), "/bootstrap/test-data/article/category.json")
      initData(mongoose.model("Board"), "/bootstrap/test-data/board/board.json")
      initData(mongoose.model("Gallery"), "/bootstrap/test-data/photo/gallery.json")

const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  email_id: {
    type: String,
  },
  password: {
    type: String,
  },
});

//Creating the collection User
const User = mongoose.model("UserVoter", userSchema);

module.exports = User;

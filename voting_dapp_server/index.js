const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const ElectionsContract = require("./contracts/Election.json");

app.use(bodyParser.json({ extended: false }));

app.use(cors());
app.listen(5000, () => {
  console.log("sever listening on port:5000");
});

const url =
  "mongodb://localhost:27017/?readPreference=primary&directConnection=true&ssl=false";

const connectionParams = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
};
mongoose
  .connect(url, connectionParams)
  .then(() => {
    console.log("Connected to database ");
  })
  .catch((err) => {
    console.error(`Error connecting to the database. \n${err}`);
  });

// parse application/json

app.get("/electionStatus", (req, res) => {
  return res.status(200).json({
    status: false,
  });
});
app.get("/contract", (req, res) => {
  return res.status(200).json({
    data: ElectionsContract,
  });
});

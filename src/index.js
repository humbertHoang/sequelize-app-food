import express from "express"
const app = express()
app.use(express.json())
app.listen(3069, () => {
  console.log(`Server Online At Port 3069`)
})

import express from "express"
import { handleError } from "./common/helpers/error.helper.js"
import rootRouter from "./routers/root.router.js"

const app = express()
const port = 3069

app.use(express.json())
app.use("/", rootRouter)
app.use((err, req, res, next) => {
  handleError(err, res)
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})

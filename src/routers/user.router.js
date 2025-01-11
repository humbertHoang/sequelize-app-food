import express from "express"
import userController from "../controllers/user.controller.js"
const userRouter = express.Router()
//Get all users
userRouter.get("/", userController.getUsers)

//Get user by id
userRouter.get("/:user_id", userController.getUserById)

//Get likes by user id
userRouter.get("/:user_id/likes", userController.getLikesByUserId)

//Get rates by user id
userRouter.get("/:user_id/rates", userController.getRatesByUserId)

//Post new order
// userRouter.post("/order", userController.addOrder)

//Post like new restaurant
userRouter.post("/likeRestaurant", userController.likeRestaurant)

//Post rate new restaurant
userRouter.post("/rateRestaurant", userController.rateRestaurant)

export default userRouter

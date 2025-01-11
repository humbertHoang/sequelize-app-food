import express from "express"
import restaurantController from "../controllers/restaurant.controller.js"
const restaurantRouter = express.Router()
// Add new restaurant
restaurantRouter.post("/add", restaurantController.addRestaurant)
// Get all restaurants
restaurantRouter.get("/", restaurantController.getRestaurants)
// Get restaurant by id
restaurantRouter.get("/:res_id", restaurantController.getRestaurantById)
// Get likes by restaurant id
restaurantRouter.get(
  "/:res_id/likes",
  restaurantController.getLikesByRestaurantId
)
// Get rates by restaurant id
restaurantRouter.get(
  "/:res_id/rates",
  restaurantController.getRatesByRestaurantId
)

export default restaurantRouter

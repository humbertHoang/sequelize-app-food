import ResponseHelper from "../common/helpers/response.helper.js"
import restaurantService from "../services/restaurant.service.js"

const restaurantController = {
  addRestaurant: async (req, res, next) => {
    try {
      const newRestaurant = await restaurantService.addRestaurant(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        newRestaurant,
        "Successfully added new restaurant",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getRestaurants: async (req, res, next) => {
    try {
      const restaurants = await restaurantService.getRestaurants()
      const resData = new ResponseHelper().sendSuccess(
        res,
        restaurants,
        "Successfully retrieved restaurants",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getRestaurantById: async (req, res, next) => {
    try {
      const restaurant = await restaurantService.getRestaurantById(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        restaurant,
        "Successfully retrieved restaurant",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getLikesByRestaurantId: async (req, res, next) => {
    try {
      const likes = await restaurantService.getLikesByRestaurantId(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        likes,
        "Successfully retrieved users who liked this restaurant",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getRatesByRestaurantId: async (req, res, next) => {
    try {
      const rates = await restaurantService.getRatesByRestaurantId(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        rates,
        "Successfully retrieved users who rated this restaurant",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
}
export default restaurantController

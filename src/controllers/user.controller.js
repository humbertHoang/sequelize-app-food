import ResponseHelper from "../common/helpers/response.helper.js"
import userService from "../services/user.service.js"

const userController = {
  getUsers: async (req, res, next) => {
    try {
      const user = await userService.getUsers(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        user,
        "Successfully retrieved users",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getUserById: async (req, res, next) => {
    try {
      const user = await userService.getUserById(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        user,
        "Successfully retrieved user",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getLikesByUserId: async (req, res, next) => {
    try {
      const likes = await userService.getLikesByUserId(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        likes,
        "Successfully retrieved restaurants liked by user",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  getRatesByUserId: async (req, res, next) => {
    try {
      const rates = await userService.getRatesByUserId(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        rates,
        "Successfully retrieved restaurants rated by user",
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  likeRestaurant: async (req, res, next) => {
    try {
      const like = await userService.likeRestaurant(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        like,
        like.message,
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
  rateRestaurant: async (req, res, next) => {
    try {
      const rate = await userService.rateRestaurant(req)
      const resData = new ResponseHelper().sendSuccess(
        res,
        rate,
        rate.message,
        200
      )
      return resData
    } catch (error) {
      next(error)
    }
  },
}
export default userController

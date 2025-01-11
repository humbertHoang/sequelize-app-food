import { BadRequestException } from "../common/helpers/error.helper.js"
import { models } from "../common/sequelize/init.sequelize.js"

const restaurantService = {
  addRestaurant: async (req) => {
    if (!req.body.res_name || !req.body.image || !req.body.desc) {
      throw new BadRequestException("Missing required fields", 400)
    }
    const resExist = await models.restaurant.findOne({
      where: { res_name: req.body.res_name },
      raw: true,
    })
    if (resExist) {
      throw new BadRequestException("Restaurant already exists", 400)
    }
    const newRestaurant = await models.restaurant.create(req.body)
    return {
      id: newRestaurant.res_id,
      name: newRestaurant.res_name,
      image: newRestaurant.image,
      description: newRestaurant.desc,
      createdAt: newRestaurant.createdAt,
    }
  },

  getRestaurants: async () => {
    const restaurants = await models.restaurant.findAll({ raw: true })
    return restaurants
  },

  getRestaurantById: async (req) => {
    const restaurant = await models.restaurant.findOne({
      where: { res_id: req.params.res_id },
      raw: true,
    })
    if (!restaurant) {
      throw new BadRequestException("Restaurant not found", 404)
    }
    return restaurant
  },

  getLikesByRestaurantId: async (req) => {
    const resExist = await models.restaurant.findOne({
      where: { res_id: req.params.res_id },
      raw: true,
    })
    if (!resExist) {
      throw new BadRequestException("Restaurant not found", 404)
    }

    const likes = await models.like_res.findAll({
      attributes: ["date_like"],
      where: { res_id: resExist.res_id },
      include: {
        model: models.user,
        as: "user",
        attributes: ["user_id", "full_name", "email"],
      },
      raw: true,
      nest: true,
    })

    return likes.map((like) => ({
      user_id: like.user.user_id,
      full_name: like.user.full_name,
      email: like.user.email,
      likedAt: like.date_like,
    }))
  },

  getRatesByRestaurantId: async (req) => {
    const resExist = await models.restaurant.findOne({
      where: { res_id: req.params.res_id },
      raw: true,
    })
    if (!resExist) {
      throw new BadRequestException("Restaurant not found", 404)
    }

    const rates = await models.rate_res.findAll({
      attributes: ["amount", "date_rate"],
      where: { res_id: resExist.res_id },
      include: {
        model: models.user,
        as: "user",
        attributes: ["user_id", "full_name", "email"],
      },
      raw: true,
      nest: true,
    })
    return rates.map((rate) => ({
      user_id: rate.user.user_id,
      full_name: rate.user.full_name,
      email: rate.user.email,
      rating: rate.amount,
      ratedAt: rate.date_rate,
    }))
  },
}
export default restaurantService

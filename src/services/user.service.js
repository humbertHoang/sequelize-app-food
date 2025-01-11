import { BadRequestException } from "../common/helpers/error.helper.js"
import { models } from "../common/sequelize/init.sequelize.js"
const userService = {
  getUsers: async (req) => {
    const user = await models.user.findAll({ raw: true })
    return user
  },
  getUserById: async (req) => {
    const user = await models.user.findOne({
      where: { user_id: req.params.user_id },
      raw: true,
    })
    if (!user) {
      return new BadRequestException("User not found", 404)
    }
    return user
  },
  getLikesByUserId: async (req) => {
    const user = await models.user.findOne({
      where: { user_id: req.params.user_id },
      raw: true,
    })
    if (!user) {
      return new BadRequestException("User not found", 404)
    }

    const likes = await models.like_res.findAll({
      attributes: ["date_like"],
      where: { user_id: user.user_id },
      include: {
        model: models.restaurant,
        as: "re",
        attributes: ["res_id", "res_name", "image", "desc"],
      },
      raw: true,
      nest: true,
    })

    return likes.map((like) => ({
      res_id: like.re.res_id,
      res_name: like.re.res_name,
      image: like.re.image,
      desc: like.re.desc,
      likedAt: like.date_like,
    }))
  },
  getRatesByUserId: async (req) => {
    const user = await models.user.findOne({
      where: { user_id: req.params.user_id },
      raw: true,
    })
    if (!user) {
      return new BadRequestException("User not found", 404)
    }

    const rates = await models.rate_res.findAll({
      attributes: ["amount", "date_rate"],
      where: { user_id: user.user_id },
      include: {
        model: models.restaurant,
        as: "re",
        attributes: ["res_id", "res_name", "image", "desc"],
      },
      raw: true,
      nest: true,
    })
    return rates.map((rate) => ({
      res_id: rate.re.res_id,
      res_name: rate.re.res_name,
      image: rate.re.image,
      desc: rate.re.desc,
      rating: rate.amount,
      ratedAt: rate.date_rate,
    }))
  },
  likeRestaurant: async (req) => {
    const { user_id, res_id } = req.body
    if (!user_id || !res_id) {
      throw new BadRequestException("Missing required fields", 400)
    }

    const user = await models.user.findOne({
      where: { user_id },
      raw: true,
    })
    if (!user) {
      throw new BadRequestException("User not found", 404)
    }

    const restaurant = await models.restaurant.findOne({
      where: { res_id },
      raw: true,
    })
    if (!restaurant) {
      throw new BadRequestException("Restaurant not found", 404)
    }

    const like = await models.like_res.findOne({
      where: { user_id, res_id },
      raw: true,
    })

    if (like) {
      await models.like_res.destroy({
        where: { user_id, res_id },
      })
      return {
        action: "unlike",
        user_id: +user_id,
        res_id: +res_id,
        message: "Successfully unliked restaurant",
      }
    }

    const today = new Date().toISOString().split("T")[0]
    await models.like_res.create({
      user_id: +user_id,
      res_id: +res_id,
      date_like: today,
    })

    return {
      action: "like",
      user_id: +user_id,
      res_id: +res_id,
      date_like: today,
      message: "Successfully liked restaurant",
    }
  },
  rateRestaurant: async (req) => {
    const { user_id, res_id, amount } = req.body
    if (!user_id || !res_id || !amount) {
      throw new BadRequestException("Missing required fields", 400)
    }
    if (amount < 1 || amount > 5) {
      throw new BadRequestException("Invalid rating", 400)
    }
    const user = await models.user.findOne({
      where: { user_id },
      raw: true,
    })
    if (!user) {
      throw new BadRequestException("User not found", 404)
    }

    const restaurant = await models.restaurant.findOne({
      where: { res_id },
      raw: true,
    })
    if (!restaurant) {
      throw new BadRequestException("Restaurant not found", 404)
    }

    const rate = await models.rate_res.findOne({
      where: { user_id, res_id },
      raw: true,
    })
    const today = new Date().toISOString().split("T")[0]
    if (rate) {
      await models.rate_res.update(
        {
          amount: +amount,
          date_rate: today,
        },
        {
          where: { user_id, res_id },
        }
      )
      return {
        action: "update rate",
        user_id: +user_id,
        res_id: +res_id,
        amount: +amount,
        date_rate: today,
        message: "Successfully update rate restaurant",
      }
    }

    await models.rate_res.create({
      user_id: +user_id,
      res_id: +res_id,
      amount: +amount,
      date_rate: today,
    })

    return {
      action: "rate",
      user_id: +user_id,
      res_id: +res_id,
      amount: +amount,
      date_rate: today,
      message: "Successfully rate restaurant",
    }
  },
  // addOrder: async (req) => {},
}
export default userService

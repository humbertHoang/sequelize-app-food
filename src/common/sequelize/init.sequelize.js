import { Sequelize } from "sequelize"
import initModels from "../../models/init-models.js"

const sequelize = new Sequelize(
  "mysql://root:1234@localhost:3307/bt_app_food",
  {
    logging: false,
  }
)
const models = initModels(sequelize)
const checkDBConnection = async () => {
  try {
    await sequelize.authenticate()
  } catch (error) {
    console.error("Unable to connect to the database:", error)
  }
}
checkDBConnection()
export { models, sequelize }

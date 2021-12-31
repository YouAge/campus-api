const moment = require('moment')
const {Sequelize} = require("sequelize");
const {Model} = require("sequelize");
const {sequelize} = require('../utils/db-sequelize.js')

class GoodsTagModel extends Model {
}

GoodsTagModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  status: {
    type: Sequelize.BOOLEAN,
    defaultValue: false,
    comment: '状态是否使用'
  },
  created_at: {
    type: Sequelize.DATE,
    allowNull: false,
    get() {
      return moment(this.getDataValue('created_at')).format('YYYY-MM-DD');
    }
  }
}, {
  sequelize,
  tableName: 'good_tag'
})

module.exports = {
  GoodsTagModel
}

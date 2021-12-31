const moment = require('moment')
const {Sequelize} = require("sequelize");
const {Model} = require("sequelize");
const {sequelize} = require('../utils/db-sequelize.js')


class BrandModel extends Model {
}

BrandModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false
  },
  nameEn: {
    type: Sequelize.STRING(255),
    allowNull: false,
    field: 'name_en',
    comment: "英文名"
  },
  picture: {
    type: Sequelize.STRING(255),
    allowNull: false,
    comment: "图片地址"
  },
  logo: {
    type: Sequelize.STRING(255),
    allowNull: false,
    comment: "logo地址"
  },
  place: {
    type: Sequelize.STRING(255),
    allowNull: true,
    comment: "介绍"
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
  tableName: 'brand',
})


module.exports = {
  BrandModel
}

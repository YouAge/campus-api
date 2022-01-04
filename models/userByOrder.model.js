const {ByProductModel} = require("./byProduct.model.js");
const moment = require('moment')
const {Sequelize} = require("sequelize");
const {Model} = require("sequelize");
const {sequelize} = require('../utils/db-sequelize.js')

class UserByOrderModel extends Model {
}

UserByOrderModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
  },
  userId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'user_id'
  },
  orderId: {
    type: Sequelize.STRING,
    unique: true,
    allowNull: true,
    field: 'order_id',
    comment: "订单号",

  },

  shopNumber: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "商品数量"
  },
  address: {
    type: Sequelize.JSON,
    comment: '收获地址'
  },
  status: {
    type: Sequelize.INTEGER,
    defaultValue: 1,
    comment: '购物状态，0 待付款，1已完成 ，2退款中，3退款完成',
    validate: {
      isIn: {
        args: [[0, 1, 2, 3]],
        msg: "必须是数字0或者1"
      }
    },
    get() {
      const od = this.getDataValue('status')
      return byShopStatus[od]
    }
  },
  created_at: {
    type: Sequelize.DATE,
    allowNull: false,
    get() {
      return moment(this.getDataValue('created_at')).format('YYYY-MM-DD HH:mm:ss');
    }
  }

}, {
  sequelize,
  tableName: 'user-by-shop'
})




const byShopStatus = {
  0: '待付款',
  1: '待发货',
  2: '待收获',
  3: '已完成',
  4: '退款中',
  5: '已退货'
}


// 订单 => 商品，  一对多
// 商品和类型
UserByOrderModel.hasMany(ByProductModel, {
  foreignKey: 'orderId',
  targetKey: 'id',
  constraints: false,
  as: 'goods'
})
ByProductModel.belongsTo(UserByOrderModel, {
  foreignKey: 'orderId',
  sourceKey: 'id',
  constraints: false,
  as: 'order'
})

module.exports = {
  UserByOrderModel,
  byShopStatus
}




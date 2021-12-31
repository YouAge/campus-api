const {ByProductModel} = require("./byProduct.model.js");
const {getRandom} = require("../utils");
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
    set(val) {
      // 生成订单号， 时间+ 随机数字
      const id = setOrderId()
      this.setDataValue('order_id', id)
    }
  },

  shopNumber: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "商品数量"
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
  }


}, {
  sequelize,
  tableName: 'user-by-shop'
})


function setOrderId() {
  //订单号生成， 4+时间戳+4
  // UserByShopModel.findOne({where:{id:'1'}})
  // const h = getRandom(4)
  const f = getRandom(10)
  const orderId = '' + new Date().getTime() + f
  const p = UserByOrderModel.findOne({where: {orderId: orderId}})
  if (p) {
    return setOrderId()
  }
  return orderId
}

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
UserByOrderModel.belongsTo(ByProductModel, {
  foreignKey: 'orderId',
  targetKey: 'id',
  constraints: false
})
ByProductModel.hasMany(UserByOrderModel, {
  foreignKey: 'orderId',
  sourceKey: 'id',
  constraints: false,
})

module.exports = {
  UserByOrderModel
}




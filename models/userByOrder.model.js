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
  // payMoney:{
  //   type:
  // },
  payMoney: {
    type: Sequelize.FLOAT(10,2),
    allowNull: true,
    comment: "总价格",
    field:"pay_money"
  },

  address: {
    type: Sequelize.JSON,
    comment: '收获地址'
  },
  orderState: {
    type: Sequelize.INTEGER,
    defaultValue: 1,
    field:'status',
    comment: '购物状态，1 待付款，2待发货 ，3待收获，4待评价,5 已完成 ,6 以取消',
    validate: {
      isIn: {
        args: [[1, 2, 3, 4,5,6]],
        msg: "必须是数字0或者1"
      }
    },
    // get() {
    //   const od = this.getDataValue('status')
    //   return byShopStatus[od]
    // }
  },

  payLateTime:{
    type: Sequelize.DATE,
    field: 'pay_late_time',
    allowNull: false,
    comment:'最后截止的时间',
    validate: {
      notEmpty: true
    },
    get() {
      return moment(this.getDataValue('pay_late_time')).format('YYYY-MM-DD HH:mm:ss');
    },
    // set(value){
    //   const dtim = new Date()
    //   const payLatestTime = new Date(dtim.setMinutes(dtim.getMinutes() + 30))
    //   console.log(value)
    //   this.setDataValue('pay_late_time','2022-12-12 10:22:33')
    // }
  },
  countdown:{
    type: Sequelize.VIRTUAL, // 虚拟字段，
    allowNull: true,
    comment: "倒计时，-1，或者秒",
    get(){
      const dtime = new Date(this.getDataValue('payLateTime'))
      const stime = new Date()
      let countdown = dtime.getTime() - stime.getTime()
      countdown = countdown > 0 ? parseInt(countdown / 1000) : -1
      return countdown
    },
    set(){
      throw new Error('不设置该字段')
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




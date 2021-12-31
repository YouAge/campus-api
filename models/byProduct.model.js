const moment = require('moment')
const {Model, Sequelize, DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')

class ByProductModel extends Model {
}

ByProductModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
  },
  orderId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'order_id',
    comment: "订单号"
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false,
    comment: "商品名字"
  },
  picture: {
    type: Sequelize.JSON,
    allowNull: false,
    comment: "图片",
    defaultValue: []
  },
  discount: {
    type: Sequelize.FLOAT(10, 2),
    allowNull: true,
    comment: "支付价格",
  },
  price: {
    type: Sequelize.FLOAT(10, 2), // 虚拟字段，
    allowNull: true,
    comment: "原价格",
  },
  count: {
    type: Sequelize.INTEGER,
    comment: '库存量',
  },
  // cateId: {
  //   type: DataTypes.INTEGER,
  //   allowNull: true,
  //   defaultValue: 0,
  //   field:"cate_id",
  //   comment: "分类",
  //   set(val) {
  //     if(Array.isArray(val)){
  //       this.setDataValue("cate_id", val[val.length-1]);
  //     }else {
  //       this.setDataValue("cate_id", val);
  //     }
  //   },
  // },
  // brandId:{
  //   type: DataTypes.INTEGER,
  //   allowNull: true,
  //   defaultValue: 0,
  //   field:"brand_id",
  //   comment: "品牌id",
  // },
  skus: {
    type: Sequelize.JSON,
    defaultValue: [],
    comment: '属性，[]'
  },
  // 优惠劵 ...
  created_at: {
    type: Sequelize.DATE,
    allowNull: false,
    get() {
      return moment(this.getDataValue('created_at')).format('YYYY-MM-DD');
    }
  }
}, {
  sequelize,
  tableName: 'by_product',
})


module.exports = {
  ByProductModel
}

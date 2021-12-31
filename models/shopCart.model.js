const {GoodsSkuModel} = require("./goods_sku.model.js");
const {GoodsModel} = require("./goods.model.js");
const {Sequelize} = require("sequelize");
const {Model} = require("sequelize");
const {sequelize} =require('../utils/db-sequelize.js')

class ShopCartModel extends  Model{}
ShopCartModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
  },
  goodsId: {
    type: Sequelize.INTEGER,
    allowNull: true,
    field: 'goods_id',
    comment: "商品id"
  },
  skuId: {
    type: Sequelize.INTEGER,
    allowNull: true,
    field: 'sku_id',
    comment: "skuid"
  },
  userId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'user_id'
  },
  shopNumber: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "商品数量"
  }
},{
  sequelize,
  tableName: 'shop-cart'
})

ShopCartModel.belongsTo(GoodsModel, {
  foreignKey: 'goodsId',
  targetKey: 'id',
  constraints: false
})
ShopCartModel.belongsTo(GoodsSkuModel, {
  foreignKey: 'skuId',
  targetKey: 'id',
  constraints: false
})


module.exports ={
  ShopCartModel
}

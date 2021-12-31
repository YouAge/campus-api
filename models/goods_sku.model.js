
const moment = require('moment')
const {SpecsModel} = require("./specs.model.js");
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')

class GoodsSkuModel extends Model{}
GoodsSkuModel.init(  {
  id: {
    type: DataTypes.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
    // defaultValue : DataTypes.UUIDV4
  },
  goodsId: {
    type: DataTypes.INTEGER,
    allowNull: true,
    field:'goods_id',
    comment: "商品id"
  },
  name: {
    type: Sequelize.STRING(255),
    comment: "名字"
  },
  inventory: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "商品数量"
  },
  price: {
    type: DataTypes.FLOAT(10,2),
    allowNull: true,
    comment: "新价格"
  },
  oldPrice: {
    type: DataTypes.FLOAT(10,2),
    allowNull: true,
    comment: "原价"
  },
  picture: {
    type: DataTypes.STRING(255),
    allowNull: true,
    comment: "图片"
  },
  desc: {
    type: DataTypes.STRING(255),
    allowNull: true,
    comment: "介绍"
  },
  specs:{
    type:DataTypes.JSON,
    defaultValue: [],
    comment:'属性，[]'
  }

}, {
  sequelize,
  tableName: 'goods_sku',
  indexes: [
    {
      name: "PRIMARY",
      unique: true,
      using: "BTREE",
      fields: [
        { name: "id" },
      ]
    },
  ]
})

// sku 对 属性 多对多关系
GoodsSkuModel.belongsToMany(SpecsModel,{foreignKey:'sku_id', as:'Specs',through:"goods_sku_specs"})
SpecsModel.belongsToMany(GoodsSkuModel,{foreignKey:'specs_id', as:'GoodsSku',through:"goods_sku_specs"})

module.exports ={
  GoodsSkuModel
}

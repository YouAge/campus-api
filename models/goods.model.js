const moment = require('moment')
const {CateModel} = require("./cate.model.js");
const {GoodsSkuModel} = require("./goods_sku.model.js");
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')
class GoodsModel extends Model{}
GoodsModel.init( {
  id: {
    type: Sequelize.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
    // defaultValue : DataTypes.UUIDV4
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false,
    comment: "商品名字"
  },
  desc: {
    type: DataTypes.STRING(255),
    allowNull: true,
    comment: "商品描述"
  },
  picture: {
    type: DataTypes.JSON,
    allowNull: false,
    comment: "图片",
    defaultValue:[]
  },
  discount: {
    type: DataTypes.VIRTUAL,
    allowNull: true,
    comment: "折扣价格",
    get(){
      if(this.skus.length>0){
        return this.skus[0].price
      }
      return 0.0
    },
    set(){
      throw new Error('不设置该字段')
    }
  },
  price: {
    type: DataTypes.VIRTUAL, // 虚拟字段，
    allowNull: true,
    comment: "价格",
    get(){
      console.log(this)
      if(this.skus.length>0){
        return this.skus[0].price
      }
      return 0.0
    },
    set(){
      throw new Error('不设置该字段')
    }
  },
  inventory:{
    type:DataTypes.VIRTUAL,
    comment:'库存量',
    get(){
      if(this.skus.length>0){
        let t = 0
        this.skus.forEach(item=>{
          t = t+item.inventory
        })
        return t
      }
      return 0
    },
    set(){
      throw new Error('不设置该字段')
    }
  },
  cateId: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
    field:"cate_id",
    comment: "分类",
    set(val) {
      if(Array.isArray(val)){
        this.setDataValue("cate_id", val[val.length-1]);
      }else {
        this.setDataValue("cate_id", val);
      }
    },
  },
  status:{
    type:DataTypes.BOOLEAN,
    defaultValue: false,
    comment: '状态是否使用'
  },
  //销量， 收藏， 点击率，


  details:{
    type:DataTypes.TEXT,
    defaultValue:'',
    comment:'商品详情'
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
  tableName: 'goods',
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


GoodsModel.hasMany(GoodsSkuModel,{
  foreignKey:'goodsId',
  sourceKey: 'id',
  constraints: false,
  as:'skus'
})
GoodsSkuModel.belongsTo(GoodsModel,{
  foreignKey:'goodsId',
  targetKey: 'id',
  constraints: false
})


GoodsModel.belongsTo(CateModel,{
  foreignKey: 'cate_id',
  targetKey:'id',
  constraints: false
})
CateModel.hasMany(GoodsModel,{
  foreignKey:'cate_id',
  sourceKey: 'id',
  constraints: false,
})

module.exports = {
  GoodsModel
}

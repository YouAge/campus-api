const moment = require('moment')
const {GoodsTagModel} = require("./goods_tag.model.js");
const {BrandModel} = require("./brand.model.js");
const {CateModel} = require("./cate.model.js");
const {GoodsSkuModel} = require("./goods_sku.model.js");
const {Model, Sequelize, DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')

class GoodsModel extends Model {
}

GoodsModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,  // 主键
    autoIncrement: true, // 自增长
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
      if (this.skus && this.skus.length > 0) {
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
      if (this.skus && this.skus.length > 0) {
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
      if (this.skus && this.skus.length > 0) {
        let t = 0
        this.skus.forEach(item => {
          t = t + item.inventory
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
    field: "cate_id",
    comment: "分类",
    set(val) {
      if (Array.isArray(val)) {
        this.setDataValue("cateId", val[val.length - 1]);
      } else {
        this.setDataValue("cateId", val);
      }
    },
  },
  brandId: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
    field: "brand_id",
    comment: "品牌id",
  },
  status: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    comment: '状态是否使用'
  },
  //销量， 收藏， 点击率，

  isTypeExplain: {
    type: DataTypes.INTEGER,
    defaultValue: 1,
    field: "is_type_explain",
    comment: '什么类型商品介绍',
    get() {
      const od = this.getDataValue('is_type_explain')
      return typeExplain[od]
    }
  },

  particulars: {
    type: DataTypes.TEXT,
    defaultValue: '',
    comment: '商品详情'
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

// 商品 sku
GoodsModel.hasMany(GoodsSkuModel,{
  foreignKey:'goodsId',
  sourceKey: 'id',
  constraints: false,
  as: 'skus'
})
GoodsSkuModel.belongsTo(GoodsModel, {
  foreignKey: 'goodsId',
  targetKey: 'id',
  constraints: false
})

// 商品和类型
GoodsModel.belongsTo(CateModel, {
  foreignKey: 'cateId',
  targetKey: 'id',
  constraints: false,
  as: 'cate'
})
CateModel.hasMany(GoodsModel, {
  foreignKey: 'cateId',
  sourceKey: 'id',
  constraints: false,
})

// 商品 与品牌
GoodsModel.belongsTo(BrandModel, {
  foreignKey: 'brandId',
  targetKey: 'id',
  constraints: false
})
BrandModel.hasMany(GoodsModel, {
  foreignKey: 'brandId',
  sourceKey: 'id',
  constraints: false,
})

// 商品和标签 多对多
GoodsModel.belongsToMany(GoodsTagModel, {
  through: {
    model: 'tags_goods'
  },
  foreignKey: 'goods_id',
  constraints: false,
  as: 'tags'
})
GoodsTagModel.belongsToMany(GoodsModel, {
  through: {
    model: 'tags_goods'
  },
  foreignKey: 'goods_tag_id',
  constraints: false,
  as: "goods"
})

const typeExplain = {
  1: 'goods',
  2: 'article',
}

module.exports = {
  GoodsModel
}

const moment = require('moment')
const bcrypt = require('bcryptjs')
const {UserByOrderModel} = require("./userByOrder.model.js");
const {ShopCartModel} = require("./shopCart.model.js");
const {AddressModel} = require("./address.model.js");
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')


class GoodUserModel extends Model{
}
GoodUserModel.init( {
  id: {
    type: Sequelize.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
  },
  username: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  password: {
    type:DataTypes.STRING,
    set(val) {
      if(!val){
        this.setDataValue("password", null)
        return
      }
      // 加密
      const salt = bcrypt.genSaltSync(10);
      // console.log(salt)
      // 生成加密密码
      const psw = bcrypt.hashSync(val, salt);
      this.setDataValue("password", psw);
    },
    // allowNull: false,
    comment: '管理员密码'
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: true,
    validate: {
      isEmail: true
    }
  },
  iphone: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  sex: {
    type: DataTypes.STRING(255),
    defaultValue: '保密',
    allowNull: true
  },
  status:{
    type:DataTypes.BOOLEAN,
    defaultValue: false,
    comment: '状态是否使用'
  },
  desc:{
    type: DataTypes.TEXT,
    defaultValue: '',
    // allowNull: true
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
  tableName: 'good_user'
})



GoodUserModel.hasMany(AddressModel,{
  foreignKey:'userId',
  sourceKey: 'id',
  constraints: false,
  as:'address'
})
AddressModel.belongsTo(GoodUserModel,{
  foreignKey:'userId',
  targetKey: 'id',
  constraints: false
})

//购物车
GoodUserModel.hasMany(ShopCartModel,{
  foreignKey:'userId',
  sourceKey:'id',
  as: 'cart'
})

// 以购买的历史商品，或者是待付款
GoodUserModel.hasMany(UserByOrderModel, {
  foreignKey: 'userId',
  sourceKey: 'id',
  as: 'ordes'
})
UserByOrderModel.belongsTo(GoodUserModel, {
  foreignKey: 'userId',
  targetKey: 'id',
  constraints: false,
  as: 'user'
})

module.exports = {
  GoodUserModel
}

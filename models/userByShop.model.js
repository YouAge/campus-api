const {Sequelize} = require("sequelize");
const {Model} = require("sequelize");
const {sequelize} =require('../utils/db-sequelize.js')

class UserByShopModel extends  Model{

    setOrderId(){
     // UserByShopModel.findOne({where:{id:'1'}})
   }
}
UserByShopModel.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
  },
  goodsId:{
    type: Sequelize.INTEGER,
    allowNull: true,
    field:'goods_id',
    comment: "商品id"
  },
  userId:{
    type: Sequelize.INTEGER,
    allowNull: false,
    field:'user_id'
  },
  orderId:{
    type: Sequelize.STRING,
    unique:true,
    allowNull: true,
    field:'order_id',
    comment: "订单号",
    set(){
      // 生成订单号， 时间+ 随机数字
    }
  },

  shopNumber:{
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "商品数量"
  },

},{
  sequelize,
  tableName: 'user-by-shop'
})





module.exports ={
  UserByShopModel
}




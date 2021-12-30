const moment = require('moment')
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')


class AddressModel extends Model{}
AddressModel.init({
  id: {
    type: DataTypes.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    field:'user_id'
  },
  name: {
    type: DataTypes.STRING(255),
    allowNull: true,
    comment: "收件人"
  },
  iPhone: {
    type: DataTypes.STRING(255),
    allowNull: true,
    field:'iphone',
    comment: "电话"
  },
  address: {
    type: DataTypes.STRING(255),
    allowNull: true,
    field:'address',
    comment: "地址"
  },
  is_default: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue: 0,
    comment: "默认地址"
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
  tableName: 'address',
  // timestamps: true,
  deletedAt:true,
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


module.exports ={
  AddressModel
}

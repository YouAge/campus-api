
const moment = require('moment')
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')

class AdminUserModel extends Model{}
AdminUserModel.init({
  id: {
    type: DataTypes.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
  },
  username: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  password: {
    type:DataTypes.STRING,
    set(val) {
      // 加密
      const salt = bcrypt.genSaltSync(10);
      // 生成加密密码
      const psw = bcrypt.hashSync(val, salt);
      this.setDataValue("password", psw);
    },
    allowNull: false,
    comment: '管理员密码'
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: true
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
  isSuper:{
    type:DataTypes.BOOLEAN,
    defaultValue: false,
    comment:'是否是超级管理员'
  },
  status:{
    type:DataTypes.BOOLEAN,
    defaultValue: false,
    comment: '状态是否使用'
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
  tableName: 'admin_user',
  timestamps: true,
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

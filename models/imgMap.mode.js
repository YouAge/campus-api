
const moment = require('moment')
const {Model,Sequelize,DataTypes} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')
class ImgMapMode extends Model{}
ImgMapMode.init({
  id: {
    type: DataTypes.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true, // 自增长
  },
  name: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  superId: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue:0,
    comment: "父id"
  },
  value: {
    type: DataTypes.STRING(255),
    allowNull: false,
    comment: "文件名字， 只能是英文"
  },
  desc: {
    type: DataTypes.STRING(255),
    allowNull: true,
    comment: "描述"
  },
  layer: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
    comment: "排序0"
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
},{
  sequelize,
  tableName: 'img-map',
})

ImgMapMode.hasMany(ImgMapMode,{ constraints: false,foreignKey:'superId',through:null,as:'children',})

module.exports={
  ImgMapMode
}

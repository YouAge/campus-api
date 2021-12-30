
const {Model,Sequelize} = require('sequelize')
const {sequelize} = require('../utils/db-sequelize.js')
class SpecsModel extends Model{}
SpecsModel.init({
  id: {
    type:Sequelize.INTEGER,
    primaryKey:true,  // 主键
    autoIncrement:true // 自增长
    // defaultValue : DataTypes.UUIDV4
  },
  name: {
    type: Sequelize.STRING(255),
    allowNull: false,
    // unique:true, // weiyi
    comment: "名字"
  },
  superId: {
    type: Sequelize.INTEGER,
    allowNull: true,
    defaultValue:0,
    field:'super_id',
    comment: "父id"
  },
  desc: {
    type: Sequelize.STRING(255),
    defaultValue: '',
    comment: "介绍"
  },
}, {
  sequelize,
  tableName: 'specs',
})

SpecsModel.hasMany(SpecsModel,{ constraints: false,foreignKey:'superId',through:null,as:'value',})

module.exports ={
  SpecsModel
}

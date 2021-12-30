
const {Model,Sequelize,DataTypes} = require("sequelize");
const {sequelize} =require('../utils/db-sequelize.js')
class RoleModel extends Model{}

RoleModel.init( {
    id: {
      type: Sequelize.INTEGER,
      primaryKey:true,  // 主键
      autoIncrement:true, // 自增长
    },
    name: {
      type: Sequelize.STRING(255),
      allowNull: true,
      comment: "角色名"
    },
    desc: {
      type: Sequelize.STRING(255),
      allowNull: true,
      comment: "介绍，权限说明"
    },
    super_id: {
      type: Sequelize.INTEGER,
      allowNull: true,
      field:'super_id',
      defaultValue: 0,
      comment: "父id"
    },
    status:{
      type:DataTypes.BOOLEAN,
      defaultValue: false,
      comment: '状态是否使用'
    },
  }, {
    sequelize,
    tableName: 'role'
  })

module.exports ={
  RoleModel
}

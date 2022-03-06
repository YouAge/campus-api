
const  { Sequelize } = require('sequelize')
const database = require('../config').database
// const database = {
//   dialect:'mysql',//'mysql' | 'postgres' | 'sqlite' | 'mariadb' | 'mssql';
//   host:'localhost', //localhost 、、47.108.160.25
//   port: 3306, //5432  3306
//   user:'root', //postgres
//   password:'123456', // mysql9999
//   dbName:'shop'
// }

const sequelize = new Sequelize(database.dbName,database.user,database.password,{
  dialect:database.dialect, //'mysql' | 'postgres' | 'sqlite' | 'mariadb' | 'mssql';
  host: database.host,
  port: database.port,
  logging: false,
  timezone: '+08:00',
  pool:{
    max:5,
    min:0,
    idle:10000
  },
  define:{
    // paranoid:true,
    timestamps: true,
    //把驼峰命名转换为下划线
    underscored: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    deletedAt: 'deleted_at' //// 如果要强制删除，语句后面加上： force: true
  }
})


sequelize.sync({})

module.exports = {sequelize}

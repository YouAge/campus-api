
module.exports = {
  shopSecret:'sd4.0)($256f1@。jabilsdjf-a.sfa465a4g43', // jwt 密钥
  adminSecret:'sda&%@#￥@#fhis/./,1',
  database :{
    dialect:'mysql',//'mysql' | 'postgres' | 'sqlite' | 'mariadb' | 'mssql';
    host:'localhost', //localhost 、、47.108.160.25
    port: 3306, //5432  3306
    user:'root', //postgres
    password:'123456', // mysql9999
    dbName:'course'
  },
  expTime : 60*60*3  //||60*60*24 *3  //token  过期时间 3天
}

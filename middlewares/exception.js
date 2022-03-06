
const {HttpException} = require("../utils/http-exception");
const koaError = async (ctx, next)=>{

  try {
    await next()
  }catch(error) {
    //
    const isHttpException = error instanceof HttpException;
    if(isHttpException){
      ctx.body = {
        msg:error.msg,
        code:error.errorCode,
        request: `${ctx.method} ${ctx.path}`
      }
      ctx.response.status = error.code
    }else {
      // console.log(error.name)
      if(error.name === 'SequelizeUniqueConstraintError'){
        ctx.body = {
          msg: "数据id已存在！",
          error_code: 400,
          data:error.details,
          request: `${ctx.method} ${ctx.path}`
        }
        ctx.response.status = 400
      }else {
        ctx.body = {
          msg: `未知错误！ ${error}`,
          error_code: 9999,
          request: `${ctx.method} ${ctx.path} `
        }
        ctx.response.status = 500
      }


    }
  }


}

module.exports = koaError

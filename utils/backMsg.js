


function backMsg200({data={},msg='成功'}){
  return {
    data,
    code:200,
    msg,
  }
}

function backMsg400({data={},msg='失败'}){
  return {
    data,
    code:400,
    msg,
  }
}
function backMsg401({data={},msg='身份错误，请重新登入'}){
  return {
    data,
    code:401,
    msg,
  }
}


module.exports = {
  backMsg200,
  backMsg400,
  backMsg401
}

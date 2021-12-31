
const hierarchy = (list, parentMenuId = 0, superName = 'superId') => {
  if (list.length < 1) return []
  let menuObj = {}
  list.forEach((item) => {
    item.children = []
    menuObj[item.id] = item
  })
  return list.filter((item) => {
    if (item[superName] !== parentMenuId) {
      menuObj[item[superName]].children.push(item)
      return false
    }
    return true
  })
}


// 获取ip地址

function getIpAress() {
  const interfaces = require('os').networkInterfaces(); // 在开发环境中获取局域网中的本机iP地址
  let IPAdress = '';
  for(var devName in interfaces){
    var iface = interfaces[devName];
    for(var i=0;i<iface.length;i++){
      var alias = iface[i];
      if(alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal){
        IPAdress = alias.address;
      }
    }
  }
  return IPAdress
}

function getRandom(num) {
  return Math.floor((Math.random() + Math.floor(Math.random() * 9 + 1)) * Math.pow(10, num - 1));
}


function isNumber(item) {
  return typeof item === 'number' || !isNaN(item)
}


module.exports = {
  hierarchy,
  getIpAress,
  getRandom,
  isNumber
}

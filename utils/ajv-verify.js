const Ajv = require('ajv')
const addFormats = require("ajv-formats")
const {ParameterException} = require('./http-exception.js')
const schema = {
  type:'object',
  properties: {
    username: {type: "string",minLength:4,errorMessage:{
        type:'必须是字符串',
        minLength: '长度比较大于3'
      }},
    email: {type: "string",format:'email',  errorMessage: '邮箱格式不对'},
    action: {type:"array", default: ["show"],}

  },
  required:['username','email','action']
}
const ajv = new Ajv({allErrors: true,useDefaults:true,coerceTypes:true})
addFormats(ajv)
require("ajv-errors")(ajv /*, {singleError: true} */) //自定义错误

const ajvValid = (data,schema)=>{
  const validate = ajv.compile(schema)
  const valid = validate(data)
  if(!valid){
    // console.log(validate)
    throw new ParameterException(validate.errors[0].message)
  }
}
// ajv.addFormat("siNumber", {
//   type: "number",
//   validate: (x) => !isNaN(Number(x)),
// })

const data = {
  username:'asd',
  email:'a141a@aa.com'
}
// ajvValid(data,schema)
// console.log(data)


module.exports ={
  ajvValid
}

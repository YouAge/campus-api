const {backMsg200} = require("../../utils/backMsg.js");
const {commentPageMock} = require("../../config/mock.js");
const {evaluateMock} = require("../../config/mock.js");


async function evaluate(ctx,next){
    ctx.body = backMsg200({data:evaluateMock})
}
async function commentPage(ctx,next){
  ctx.body = backMsg200({data:commentPageMock})
}

module.exports ={
  evaluate,
  commentPage
}
